#!/bin/bash

WALLPAPER_DIR="$HOME/Downloads/wallpapers"
SELECTED_WALLPAPER_NAME=$(find "$WALLPAPER_DIR" -type f -printf "%f\n" | wofi --show dmenu)
SELECTED_WALLPAPER="$WALLPAPER_DIR/$SELECTED_WALLPAPER_NAME"

HYPLOCK_CONF="$HOME/.config/hypr/hyprlock.conf"

if [[ -n "$SELECTED_WALLPAPER" ]]; then
    SYMLINK_CONFIG_FILE="$HOME/.config/hypr/hyprpaper.conf"
    TARGET_FILE=$(readlink -f "$SYMLINK_CONFIG_FILE")

    MONITOR_NAME=$(hyprctl monitors | grep "Monitor" | awk '{print $2}')

    wal -i "$SELECTED_WALLPAPER"
    cp ~/.cache/wal/colors-kitty.conf ~/.config/kitty/colors.conf

    killall -USR1 kitty
    sleep 1

    echo "preload = $SELECTED_WALLPAPER" > "$TARGET_FILE"
    echo "wallpaper =$MONITOR_NAME, $SELECTED_WALLPAPER" >> "$TARGET_FILE"
    
    sed -i "s|^\(\s*path = \).*|\1$SELECTED_WALLPAPER|" "$HOME/.config/hypr/hyprlock.conf"

    killall hyprpaper 2>/dev/null
    hyprpaper -c "$TARGET_FILE" &

    killall waybar 2>/dev/null
    waybar &
else
    echo "No wallpaper selected."
fi

