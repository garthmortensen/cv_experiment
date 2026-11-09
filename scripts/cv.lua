-- Pandoc filter for the CV.
--  * <details class="detail"> blocks: dropped for print formats, kept as-is for HTML.
--  * Trailing "<!-- tag1 tag2 -->" comment on paragraphs/bullets: validated against
--    tags.yml, removed for print formats, turned into data-tags spans for HTML.

local is_html = FORMAT:match("html") ~= nil
local tags_file = os.getenv("TAGS_FILE") or "tags.yml"

local allowed = {}
do
  local f = io.open(tags_file, "r")
  if not f then
    io.stderr:write("cv.lua: cannot open " .. tags_file .. "\n")
    os.exit(1)
  end
  for line in f:lines() do
    local t = line:match("^%s*%-%s*([%w%-]+)")
    if t then allowed[t] = true end
  end
  f:close()
end

local errors = {}

local function is_space(el)
  return el and (el.t == "Space" or el.t == "SoftBreak")
end

-- Tags are a trailing HTML comment, invisible on GitHub: "text <!-- ai aws -->".
-- Removes it from the inline list and returns the tag names.
local function take_tags(inlines)
  -- ignore a trailing hard line break (two spaces at end of line) so tags still count
  while #inlines > 0 and inlines[#inlines].t == "LineBreak" do inlines:remove(#inlines) end
  local last = inlines[#inlines]
  if not (last and last.t == "RawInline" and last.format:match("html")) then
    return {}
  end
  local body = last.text:match("^<!%-%-%s*(.-)%s*%-%->$")
  if not body then return {} end
  local tags = {}
  for name in body:gmatch("[^%s,]+") do
    if not allowed[name] then table.insert(errors, name) end
    table.insert(tags, name)
  end
  inlines:remove(#inlines)
  while #inlines > 0 and is_space(inlines[#inlines]) do
    inlines:remove(#inlines)
  end
  return tags
end

local function tag_block(el)
  local tags = take_tags(el.content)
  if #tags == 0 then return nil end
  if is_html then
    el.content = { pandoc.Span(el.content, { ["data-tags"] = table.concat(tags, " ") }) }
  end
  return el
end

-- Print formats: drop everything between <details ...> and </details>.
-- HTML keeps the raw tags as written.
local function drop_details(doc)
  if is_html then return doc end
  local out, inside = pandoc.List(), false
  for _, b in ipairs(doc.blocks) do
    local raw = b.t == "RawBlock" and b.format:match("html") and b.text or ""
    if raw:match("^%s*<details") then
      inside = true
    elseif raw:match("^%s*</details>") then
      inside = false
    elseif not inside then
      out:insert(b)
    end
  end
  doc.blocks = out
  return doc
end

local function check(doc)
  if #errors > 0 then
    io.stderr:write("cv.lua: unknown tags (add to " .. tags_file .. " or fix typo): "
      .. table.concat(errors, ", ") .. "\n")
    os.exit(1)
  end
  return doc
end

return {
  { Para = tag_block, Plain = tag_block },
  { Pandoc = function(doc) return check(drop_details(doc)) end },
}
