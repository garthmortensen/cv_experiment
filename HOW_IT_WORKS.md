# How this repo works

`README.md` is the CV. It is also the single source for the website, the PDF and the DOCX, so edit that file and nothing else.

## Writing conventions

- **Dropdowns:** wrap detail content in a `<details class="detail">` block. The `<summary>` line is the link text. Leave a blank line after `</summary>` so the markdown inside renders.
  - On GitHub and the website it is an expandable section.
  - In the PDF and DOCX it is left out.
- **Tags:** end a bullet with an HTML comment listing its tags, for example `<!-- ai aws -->`. GitHub doesn't display it. The website's Highlight chips are built from these comments. Every tag must be listed in `tags.yml`, or the build fails. The comments are removed from the PDF and DOCX.
- **Page title:** set in the `Makefile` (`TITLE`), not in the README, because GitHub would display front matter as a table.

## Build

```bash
make all                     # site + PDF + DOCX, then checks
make site GOATCOUNTER=garthy # include GoatCounter analytics
```

Requires `pandoc`, `pdflatex` and `poppler-utils`. Output goes to `build/`.

| Path | Purpose |
|---|---|
| `README.md` | the CV (source) |
| `tags.yml` | allowed tags |
| `scripts/cv.lua` | pandoc filter: validates and strips tag comments, drops dropdowns for PDF/DOCX |
| `scripts/check.sh` | fails the build if the PDF is over 2 pages or a tag leaks into PDF/DOCX |
| `site/template.html`, `site/assets/` | website template, CSS and JS |
| `.github/workflows/cicd.yml` | CI |

## CI and publishing

- Every push to `main` builds, runs the checks and deploys the site to GitHub Pages.
- Pushing a tag like `v2026.11` attaches the PDF and DOCX to a GitHub Release.
- Set the repo variable `GOATCOUNTER` to your GoatCounter site code to turn on analytics.
