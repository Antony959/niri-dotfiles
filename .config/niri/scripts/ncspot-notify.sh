#!/usr/bin/env bash
set -euo pipefail

cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/ncspot-notify"
mkdir -p "$cache_dir"

last_track=""

playerctl --player=ncspot metadata --follow \
  --format '{{mpris:trackid}}|{{artist}}|{{title}}|{{mpris:artUrl}}' |
while IFS='|' read -r trackid artist title arturl; do
  [ -n "${trackid:-}" ] || continue
  [ -n "${title:-}" ] || continue

  if [ "$trackid" = "$last_track" ]; then
    continue
  fi
  last_track="$trackid"

  img="$cache_dir/cover.jpg"

  if [ -n "${arturl:-}" ]; then
    case "$arturl" in
      file://*)
        img="${arturl#file://}"
        ;;
      http://*|https://*)
        curl -Lfs "$arturl" -o "$img" || true
        ;;
    esac
  fi

  if [ -f "${img:-}" ]; then
    notify-send -a "ncspot" -i "$img" "Tocando agora" "$artist — $title"
  else
    notify-send -a "ncspot" "Tocando agora" "$artist — $title"
  fi
done

