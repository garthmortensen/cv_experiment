// CV interactivity: Recruiter/Technical view, expand/collapse, tag highlighting.
// State lives in the URL hash so links are shareable: #view=tech&tags=ai,python
(() => {
  const body = document.body;
  const details = [...document.querySelectorAll("details.detail")];
  const tagged = [...document.querySelectorAll("[data-tags]")];
  const tagbar = document.getElementById("tagbar");
  const state = { view: "recruiter", tags: new Set() };

  const track = (path) => {
    if (window.goatcounter && window.goatcounter.count) {
      window.goatcounter.count({ path, event: true });
    }
  };

  // Build the tag chips, most used first.
  const counts = {};
  tagged.forEach((el) => el.dataset.tags.split(" ").forEach((t) => (counts[t] = (counts[t] || 0) + 1)));
  Object.keys(counts).sort((a, b) => counts[b] - counts[a] || a.localeCompare(b)).forEach((t) => {
    const b = document.createElement("button");
    b.type = "button";
    b.dataset.tag = t;
    b.textContent = `${t} (${counts[t]})`;
    b.setAttribute("aria-pressed", "false");
    tagbar.appendChild(b);
  });

  const setAll = (open) => details.forEach((d) => (d.open = open));

  function render() {
    body.dataset.view = state.view;
    document.querySelectorAll("[data-view]").forEach((b) =>
      b.setAttribute("aria-pressed", String(b.dataset.view === state.view)));
    tagbar.querySelectorAll("[data-tag]").forEach((b) =>
      b.setAttribute("aria-pressed", String(state.tags.has(b.dataset.tag))));

    body.classList.toggle("filtering", state.tags.size > 0);
    tagged.forEach((el) => {
      const hit = el.dataset.tags.split(" ").some((t) => state.tags.has(t));
      const block = el.parentElement;
      block.classList.toggle("hit", hit);
      if (hit) {
        let d = block.closest("details");
        while (d) { d.open = true; d = d.parentElement.closest("details"); }
      }
    });

    const parts = [];
    if (state.view !== "recruiter") parts.push(`view=${state.view}`);
    if (state.tags.size) parts.push(`tags=${[...state.tags].join(",")}`);
    history.replaceState(null, "", parts.length ? `#${parts.join("&")}` : location.pathname);
  }

  function setView(view) {
    state.view = view;
    if (view === "recruiter") { state.tags.clear(); setAll(false); } else { setAll(true); }
    render();
  }

  // Read initial state from the hash.
  const params = new URLSearchParams(location.hash.slice(1));
  if (params.get("view") === "tech") { state.view = "tech"; setAll(true); }
  (params.get("tags") || "").split(",").filter((t) => counts[t]).forEach((t) => state.tags.add(t));
  if (state.tags.size) state.view = "tech";
  render();

  document.querySelectorAll("[data-view]").forEach((b) =>
    b.addEventListener("click", () => { setView(b.dataset.view); track(`view-${b.dataset.view}`); }));
  document.getElementById("expand-all").addEventListener("click", () => { setAll(true); track("expand-all"); });
  document.getElementById("collapse-all").addEventListener("click", () => { setAll(false); track("collapse-all"); });
  tagbar.addEventListener("click", (e) => {
    const t = e.target.closest("[data-tag]")?.dataset.tag;
    if (!t) return;
    state.tags.has(t) ? state.tags.delete(t) : state.tags.add(t);
    if (state.tags.has(t)) track(`tag-${t}`);
    render();
  });
  details.forEach((d) => d.addEventListener("toggle", () => {
    if (d.open) track(`expand-${d.querySelector("summary").textContent.trim().slice(0, 40)}`);
  }));

  // Print everything expanded, then restore.
  let saved = [];
  window.addEventListener("beforeprint", () => { saved = details.map((d) => d.open); setAll(true); });
  window.addEventListener("afterprint", () => details.forEach((d, i) => (d.open = saved[i])));
})();
