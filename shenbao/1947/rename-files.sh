#!/usr/bin/env bash
# Usage: ./rename.sh <mapping_file>
# will look in the current directory for any file matching the first column of the <mapping_file> and replace its name with the second column
# 
file="$1"
if [[ -z "$file" ]]; then
  echo "Usage: $0 <mapping_file>"
  exit 1
fi

while IFS=$'\t' read -r src dest; do
  [[ -z "$src" || "$src" == \#* ]] && continue
  mv -- "./$src" "./${dest}.md"
done < "$file"
