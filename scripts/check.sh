#!/usr/bin/env bash
# Guardrails for the ATS outputs: page limit and no leaked #tags / detail text.
set -euo pipefail
pdf=$1; docx=$2; max_pages=${MAX_PAGES:-2}
fail=0

pages=$(pdfinfo "$pdf" | awk '/^Pages:/ {print $2}')
echo "PDF pages: $pages (max $max_pages)"
if (( pages > max_pages )); then echo "FAIL: PDF exceeds $max_pages pages"; fail=1; fi

for f in "$pdf" "$docx"; do
  if [[ $f == *.pdf ]]; then text=$(pdftotext -layout "$f" -); else text=$(pandoc "$f" -t plain); fi
  if leaks=$(grep -oE '(^|[[:space:]])#[A-Za-z][A-Za-z0-9-]*' <<<"$text"); then
    echo "FAIL: tag tokens leaked into $f:"; echo "$leaks" | sort -u; fail=1
  fi
done
exit $fail
