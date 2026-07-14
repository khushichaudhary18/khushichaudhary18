#!/bin/bash

set -e

# Current date in Nepal Time
current_date=$(TZ=Asia/Kathmandu date +"%Y-%m-%d")

# Check README exists
if [ ! -f README.md ]; then
    echo "README.md not found!"
    exit 1
fi

# Replace the Date line
awk -v date="$current_date" '
/^Date :/ {
    print "Date : " date
    next
}
{
    print
}
' README.md > README.tmp

mv README.tmp README.md

echo "README updated successfully."
echo "Current date: $current_date"
