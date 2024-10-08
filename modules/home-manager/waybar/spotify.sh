#!/bin/sh

class=$(playerctl metadata --player=spotify --format '{{lc(status)}}')
icon=""

if [[ $class == "playing" || $class == "paused" ]]; then
  info=$(playerctl metadata --player=spotify --format '{{artist}} - {{title}}')
  if [[ ${#info} > 40 ]]; then
    info=$(echo "$info" | cut -c1-40)"..."
  fi
  text="$info $icon"
elif [[ $class == "stopped" ]]; then
  text=""
fi

printf '{"text":"%s", "class":"%s"}\n' "$(echo "$text" | sed 's/"/\\"/g')" "$class"