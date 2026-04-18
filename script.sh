#!/bin/bash

current_date=$(date +%Y-%m-%d)

readme=$(cat README.md)

new_readme=$(echo "$readme" | awk -v new_date="$current_date" '
  /date:/ { $0="date: " new_date }
  1
')

echo "$new_readme" > README.md

git add README.md
git diff --quiet || git commit -m "Auto update date"
git push origin main
