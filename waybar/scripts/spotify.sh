
#!/usr/bin/env bash

class=$(playerctl metadata --player=spotify --format '{{lc(status)}}')
icon=""
text=""

if [[ "$class" == "playing" ]]; then
  info=$(playerctl metadata --player=spotify --format '{{artist}} - {{title}}')
  if [[ ${#info} -gt 40 ]]; then
    info="${info:0:40}..."
  fi
  # Flip: icon first
  text="$icon $info"
elif [[ "$class" == "paused" ]]; then
  text="$icon"
elif [[ "$class" == "stopped" ]]; then
  text=""
fi

# Optional: add a "reverse" field for styling in Waybar
echo "{\"text\":\"$text\", \"class\":\"$class\", \"icon_position\":\"left\"}"
