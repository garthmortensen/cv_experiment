// Small, optional interactivity. Every control is feature-detected, so a template
// can include any subset: [data-expand-all], [data-collapse-all], [data-view], #tagbar.
// State lives in the URL hash so links are shareable: #view=tech&tags=ai,python
(() => {
  const $ = (s, r = document) => r.querySelector(s);
  const $$ = (s, r = document) => [...r.querySelectorAll(s)];
  const body = document.body;
  const details = $$("details.detail");
  const tagged = $$("[data-tags]");
  const tagbar = $("#tagbar");
  const state = { view: "recruiter", tags: new Set() };

  const track = (path) => window.goatcounter?.count?.({ path, event: true });
  const setAll = (open) => details.forEach((d) => (d.open = open));

  // Tag chips, most used first (only if the template has a #tagbar).
  const counts = {};
  if (tagbar) {
    tagged.forEach((el) => el.dataset.tags.split(" ").forEach((t) => (counts[t] = (counts[t] || 0) + 1)));
    Object.keys(counts).sort((a, b) => counts[b] - counts[a] || a.localeCompare(b)).forEach((t) => {
      const b = document.createElement("button");
      b.type = "button"; b.dataset.tag = t; b.textContent = `${t} (${counts[t]})`;
      b.setAttribute("aria-pressed", "false");
      tagbar.appendChild(b);
    });
  }

  function render() {
    body.dataset.view = state.view;
    $$("[data-view]").forEach((b) => b.setAttribute("aria-pressed", String(b.dataset.view === state.view)));
    $$("[data-tag]").forEach((b) => b.setAttribute("aria-pressed", String(state.tags.has(b.dataset.tag))));
    body.classList.toggle("filtering", state.tags.size > 0);
    tagged.forEach((el) => {
      const hit = el.dataset.tags.split(" ").some((t) => state.tags.has(t));
      el.parentElement.classList.toggle("hit", hit);
      if (hit) for (let d = el.closest("details"); d; d = d.parentElement.closest("details")) d.open = true;
    });
    const parts = [];
    if (state.view !== "recruiter") parts.push(`view=${state.view}`);
    if (state.tags.size) parts.push(`tags=${[...state.tags].join(",")}`);
    history.replaceState(null, "", parts.length ? `#${parts.join("&")}` : location.pathname);
  }

  function setView(view) {
    state.view = view;
    if (view === "recruiter") { state.tags.clear(); setAll(false); } else setAll(true);
    render();
  }

  // Initial state from the hash.
  const params = new URLSearchParams(location.hash.slice(1));
  if (params.get("view") === "tech") { state.view = "tech"; setAll(true); }
  (params.get("tags") || "").split(",").filter((t) => counts[t]).forEach((t) => state.tags.add(t));
  if (state.tags.size) state.view = "tech";
  render();

  $$("[data-view]").forEach((b) => b.addEventListener("click", () => { setView(b.dataset.view); track(`view-${b.dataset.view}`); }));
  $$("[data-expand-all]").forEach((b) => b.addEventListener("click", () => { setAll(true); track("expand-all"); }));
  $$("[data-collapse-all]").forEach((b) => b.addEventListener("click", () => { setAll(false); track("collapse-all"); }));
  tagbar?.addEventListener("click", (e) => {
    const t = e.target.closest("[data-tag]")?.dataset.tag;
    if (!t) return;
    state.tags.has(t) ? state.tags.delete(t) : state.tags.add(t);
    if (state.tags.has(t)) track(`tag-${t}`);
    render();
  });
  details.forEach((d) => d.addEventListener("toggle", () => {
    if (d.open) track(`expand-${$("summary", d).textContent.trim().slice(0, 40)}`);
  }));

  // Print with everything expanded, then restore.
  let saved = [];
  addEventListener("beforeprint", () => { saved = details.map((d) => d.open); setAll(true); });
  addEventListener("afterprint", () => details.forEach((d, i) => (d.open = saved[i])));
})();
