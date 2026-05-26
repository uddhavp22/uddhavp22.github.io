#!/bin/bash
# ─────────────────────────────────────────────────────────────
# publish.sh — sync Obsidian content to Jekyll and push
#
# Usage:
#   ./publish.sh              # sync everything and push
#   ./publish.sh --dry-run    # preview what would be copied, no push
# ─────────────────────────────────────────────────────────────

set -e

ICLOUD="/Users/uddhavs/Library/Mobile Documents/com~apple~CloudDocs/My second brain/My website shit"
SITE="$(cd "$(dirname "$0")" && pwd)"
TODAY=$(date +%Y-%m-%d)
DRY_RUN=false

if [[ "$1" == "--dry-run" ]]; then
  DRY_RUN=true
  echo "🔍 Dry run — no files will be changed"
fi

echo ""
echo "📂 Syncing from Obsidian vault..."
echo ""

# ── Helper: copy a file, skipping TEMPLATE.md ──────────────
copy_file() {
  local src="$1"
  local dest="$2"
  local basename
  basename=$(basename "$src")
  [[ "$basename" == "TEMPLATE.md" ]] && return
  if $DRY_RUN; then
    echo "  would copy: $basename → $dest"
  else
    cp "$src" "$dest"
    echo "  ✓ $basename"
  fi
}

# ── Blog posts ─────────────────────────────────────────────
# Files must be named YYYY-MM-DD-title.md OR just title.md
# (script adds today's date automatically for undated files)
echo "Blog posts:"
mkdir -p "$SITE/_posts"
for file in "$ICLOUD/Blog posts/"*.md; do
  [[ -f "$file" ]] || continue
  basename=$(basename "$file")
  if [[ "$basename" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2} ]]; then
    # Already has a date prefix — use as-is
    dest="$SITE/_posts/$basename"
  else
    # No date prefix — add today's date and slugify
    slug=$(echo "${basename%.md}" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd '[:alnum:]-')
    dest="$SITE/_posts/$TODAY-$slug.md"
  fi
  copy_file "$file" "$dest"
done

# ── Projects ───────────────────────────────────────────────
echo ""
echo "Projects:"
mkdir -p "$SITE/_projects"
for file in "$ICLOUD/Projects/"*.md; do
  [[ -f "$file" ]] || continue
  basename=$(basename "$file")
  slug=$(echo "${basename%.md}" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd '[:alnum:]-')
  copy_file "$file" "$SITE/_projects/$slug.md"
done

# ── Books / Reading ────────────────────────────────────────
echo ""
echo "Reading:"
mkdir -p "$SITE/_books"
for file in "$ICLOUD/Reading/"*.md; do
  [[ -f "$file" ]] || continue
  basename=$(basename "$file")
  slug=$(echo "${basename%.md}" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd '[:alnum:]-')
  copy_file "$file" "$SITE/_books/$slug.md"
done

echo ""

# ── Push to GitHub ─────────────────────────────────────────
if $DRY_RUN; then
  echo "🔍 Dry run complete — nothing was pushed"
else
  cd "$SITE"
  git add .
  if git diff --cached --quiet; then
    echo "✨ Nothing changed — already up to date"
  else
    git commit -m "publish: $(date '+%Y-%m-%d %H:%M')"
    git push
    echo ""
    echo "🚀 Done! Site will update at https://uddhavp22.github.io in ~1 minute"
  fi
fi
echo ""
