#!/bin/bash

WALLPAPER_DIR="$HOME/Downloads/wallpapers"
THUMB_DIR="$HOME/.cache/wallpaper_thumbs"
mkdir -p "$THUMB_DIR"

# Ensure ImageMagick is installed
if ! command -v convert &>/dev/null; then
    echo "Error: ImageMagick (convert) not found. Please install it."
    exit 1
fi

# Generate thumbnails only if missing
find "$WALLPAPER_DIR" -type f | while read -r img; do
    filename=$(basename "$img")
    thumb_path="$THUMB_DIR/$filename"
    if [[ ! -f "$thumb_path" ]]; then
        convert "$img" -resize 180x320 "$thumb_path"
    fi
done

# Select wallpaper with thumbnails
SELECTED_WALLPAPER_NAME=$(find "$WALLPAPER_DIR" -type f -printf "%f\n" | \
    wofi --show dmenu --allow-images --image-dir="$THUMB_DIR")

# Exit if nothing selected
[[ -z "$SELECTED_WALLPAPER_NAME" ]] && echo "No wallpaper selected." && exit 0

SELECTED_WALLPAPER="$WALLPAPER_DIR/$SELECTED_WALLPAPER_NAME"
HYPLOCK_CONF="$HOME/.config/hypr/hyprlock.conf"

# Update hyprpaper
SYMLINK_CONFIG_FILE="$HOME/.config/hypr/hyprpaper.conf"
TARGET_FILE=$(readlink -f "$SYMLINK_CONFIG_FILE")
MONITOR_NAME=$(hyprctl monitors | grep "Monitor" | awk '{print $2}')

wal -i "$SELECTED_WALLPAPER"
cp ~/.cache/wal/colors-kitty.conf ~/.config/kitty/colors.conf
cp ~/.cache/wal/colors-hyprland ~/.config/hypr/colors.conf
killall -USR1 kitty
sleep 1

echo "preload = $SELECTED_WALLPAPER" > "$TARGET_FILE"
echo "wallpaper = $MONITOR_NAME, $SELECTED_WALLPAPER" >> "$TARGET_FILE"

# Update hyprlock background
sed -i "s|^\(\s*path = \).*|\1$SELECTED_WALLPAPER|" "$HYPLOCK_CONF"

# Restart hyprpaper & waybar
killall hyprpaper 2>/dev/null
hyprpaper -c "$TARGET_FILE" &
killall waybar 2>/dev/null
waybar &
