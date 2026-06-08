#!/usr/bin/env bash
set -euo pipefail

root_dir="${1:-.}"

find "$root_dir" -type d -name .git -prune | while read -r gitdir; do
  repo_dir="$(dirname "$gitdir")"
  echo "Updating: $repo_dir"
  git -C "$repo_dir" pull --ff-only --recurse-submodules || echo "Failed: $repo_dir"
done
