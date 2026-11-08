# Garth Mortensen — CV

**Interactive CV:** <https://garthmortensen.github.io/cv/>

Download the latest version: [PDF](https://github.com/garthmortensen/cv/releases/latest/download/cv_garthmortensen.pdf) \| [DOCX](https://github.com/garthmortensen/cv/releases/latest/download/cv_garthmortensen.docx)

[GitHub](https://www.github.com/garthmortensen) \| [LinkedIn](https://www.linkedin.com/in/mortensengarth) \| <mortensengarth@hotmail.com>

---

## How this repo works

- `src/cv.md` is the single source.
  - `::: {.detail summary="..."}` blocks show up only on the website, as expandable sections.
  - A trailing `#tag` on a bullet drives the site's highlight filter. Allowed tags are listed in `tags.yml`.
- `make` builds `build/site/`, the PDF and the DOCX, then checks the PDF is ≤2 pages and has no leaked tags.
- Every push to `main` deploys the site. Pushing a tag like `v2026.11` publishes the PDF/DOCX as a GitHub Release.
