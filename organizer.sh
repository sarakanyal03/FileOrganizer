#!/usr/bin/env bash
# File Organizer & Cleaner

set -euo pipefail
LOGFILE=".organizer.log"
DRYRUN=false
UNDO_COUNT=0
TARGET_DIR=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dir) TARGET_DIR="$2"; shift 2;;
    --dryrun) DRYRUN=true; shift;;
    --undo) UNDO_COUNT="$2"; shift 2;;
    *) shift;;
  esac
done

[ -z "$TARGET_DIR" ] && echo "Error: Directory not specified!" && exit 1
LOGPATH="$TARGET_DIR/$LOGFILE"
timestamp() { date -u +"%Y-%m-%dT%H:%M:%SZ"; }

category_for() {
  case "${1##*.}" in
    jpg|jpeg|png|gif) echo "Images";;
    mp3|wav|ogg) echo "Audio";;
    mp4|mkv|avi|mov) echo "Video";;
    pdf|txt|doc|docx|xls|xlsx|ppt|pptx) echo "Documents";;
    zip|rar|tar|gz|7z) echo "Archives";;
    py|c|cpp|java|js|html|css|sh) echo "Code";;
    *) echo "Others";;
  esac
}

log_move() {
  echo "$(timestamp) | MOVE | $1 -> $2 | checksum: $(sha256sum "$2" | awk '{print $1}')" >> "$LOGPATH"
}

perform_move() {
  src="$1"; catg=$(category_for "$src"); dst_dir="$TARGET_DIR/$catg"
  mkdir -p "$dst_dir"
  dst="$dst_dir/$(basename "$src")"
  if $DRYRUN; then
    echo "[DRY-RUN] $src -> $dst"
  else
    mv "$src" "$dst"
    log_move "$src" "$dst"
    echo "Moved: $src -> $dst"
  fi
}

undo_last() {
  lines=$(grep " | MOVE | " "$LOGPATH" | tail -n "$1" | tac)
  while IFS= read -r line; do
    src=$(echo "$line" | awk -F ' -> ' '{print $1}' | awk '{print $4}')
    dst=$(echo "$line" | awk -F ' -> ' '{print $2}' | awk '{print $1}')
    mv "$dst" "$src"
    echo "$(timestamp) | UNDO | $dst -> $src" >> "$LOGPATH"
    echo "Undone: $dst -> $src"
  done <<< "$lines"
}

if [[ "$UNDO_COUNT" != "0" ]]; then
  undo_last "$UNDO_COUNT"; exit 0
fi

for f in "$TARGET_DIR"/*; do
  [[ -f "$f" ]] && perform_move "$f"
done

echo "Organization complete."
