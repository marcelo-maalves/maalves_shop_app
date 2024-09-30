#!/bin/bash
set -e

[ $# -eq 0 ] && { echo "Usage: $0 <command(s)>"; exit 1; }

FILES=$(find . -type f -name 'pubspec.yaml' -not -path "./.pub-cache/*")
for pubspec_path in $FILES; do
  DIR=$(dirname "$pubspec_path");
  echo ------- ${DIR}
  (cd "$DIR" && eval "$@")
done
