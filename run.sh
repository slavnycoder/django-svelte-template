#!/bin/bash
set -euo pipefail

curr_dir="$(pwd)"
cd frontend
pnpm build
cd "$curr_dir"
rm -r static/
./manage.py collectstatic --noinput
index_html_path="static/index.html"
[ -e "$index_html_path" ] && rm "$index_html_path"
./manage.py runserver
