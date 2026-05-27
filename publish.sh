#!/bin/bash
# ─────────────────────────────────────────────────────────────
# publish.sh — sync Obsidian content to Jekyll and push
#
# Usage:
#   ./publish.sh              # sync everything and push
#   ./publish.sh --dry-run    # preview what would be copied, no push
# ─────────────────────────────────────────────────────────────

set -e

ICLOUD="/Users/uddhavs/Library/Mobile Documents/com~apple~CloudDocs/My second brain"
WEBSITE="$ICLOUD/My website shit"
SITE="$(cd "$(dirname "$0")" && pwd)"
IMAGES_SRC="$ICLOUD/Images"
IMAGES_DEST="$SITE/assets/img"
TODAY=$(date +%Y-%m-%d)
DRY_RUN=false

if [[ "$1" == "--dry-run" ]]; then
  DRY_RUN=true
  echo "🔍 Dry run — no files will be changed"
fi

echo ""
echo "📂 Syncing from Obsidian vault..."
echo ""

mkdir -p "$IMAGES_DEST"

# ── Fix Obsidian image syntax + copy referenced images ───────
# Converts ![[image.png]] → ![](/assets/img/image.png)
# and copies the image file into assets/img/
process_images() {
  local file="$1"

  # Find all ![[...]] image references in the file
  grep -oE '!\[\[([^]]+\.(png|jpg|jpeg|gif|webp))\]\]' "$file" 2>/dev/null | \
  sed -E 's/!\[\[(.+)\]\]/\1/' | \
  while IFS= read -r img_name; do
    # Find the image in the Obsidian vault
    img_src="$IMAGES_SRC/$img_name"
    if [[ -f "$img_src" ]]; then
      if $DRY_RUN; then
        echo "    would copy image: $img_name → assets/img/"
      else
        cp "$img_src" "$IMAGES_DEST/$img_name"
      fi
    else
      echo "    ⚠️  image not found in vault: $img_name"
    fi
  done

  # Rewrite the syntax in the file: ![[name.png]] → ![](/assets/img/name.png)
  if ! $DRY_RUN; then
    python3 -c "
import re, sys
with open(sys.argv[1], 'r') as f:
    content = f.read()
content = re.sub(
    r'!\[\[([^\]]+\.(png|jpg|jpeg|gif|webp))\]\]',
    r'![](/assets/img/\1)',
    content
)
with open(sys.argv[1], 'w') as f:
    f.write(content)
" "$file"
  fi
}

# ── Helper: copy a file, skipping TEMPLATE.md ────────────────
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
    process_images "$dest"
    echo "  ✓ $basename"
  fi
}

# ── Blog posts ────────────────────────────────────────────────
echo "Blog posts:"
mkdir -p "$SITE/_posts"
for file in "$WEBSITE/Blog posts/"*.md; do
  [[ -f "$file" ]] || continue
  basename=$(basename "$file")
  if [[ "$basename" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2} ]]; then
    dest="$SITE/_posts/$basename"
  else
    slug=$(echo "${basename%.md}" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd '[:alnum:]-')
    dest="$SITE/_posts/$TODAY-$slug.md"
  fi
  copy_file "$file" "$dest"
done

# ── Projects ──────────────────────────────────────────────────
echo ""
echo "Projects:"
mkdir -p "$SITE/_projects"
for file in "$WEBSITE/Projects/"*.md; do
  [[ -f "$file" ]] || continue
  basename=$(basename "$file")
  slug=$(echo "${basename%.md}" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd '[:alnum:]-')
  copy_file "$file" "$SITE/_projects/$slug.md"
done

# ── Books / Reading ───────────────────────────────────────────
echo ""
echo "Reading:"
mkdir -p "$SITE/_books"
for file in "$WEBSITE/Reading/"*.md; do
  [[ -f "$file" ]] || continue
  basename=$(basename "$file")
  slug=$(echo "${basename%.md}" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd '[:alnum:]-')
  copy_file "$file" "$SITE/_books/$slug.md"
done

echo ""

# ── Push to GitHub ────────────────────────────────────────────
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
