#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/Downloads/wallpapers"

# Use wofi to select a wallpaper
SELECTED_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | wofi --show dmenu)

# If a wallpaper was selected, proceed
if [[ -n "$SELECTED_WALLPAPER" ]]; then
    # Set the wallpaper using swww
    # swww img "$selected_wallpaper"

    # set the wallpaper using hyprpaper
    #hyprctl hyprpaper reload ,"$SELECTED_WALLPAPER"

    SYMLINK_CONFIG_FILE="$HOME/.config/hypr/hyprpaper.conf"
    SYMLINK_LOCK_CONFIG="$HOME/.config/hypr/hyprlock.conf"
    TARGET_FILE=$(readlink -f "$SYMLINK_CONFIG_FILE")
    TARGET_FILE2=$(readlink -f "$SYMLINK_LOCK_CONFIG")

    # Update the color scheme using wal
    wal -i "$SELECTED_WALLPAPER"

    # Wait a bit to ensure wal has generated the colors
    sleep 1

    sed -i -e "s|preload = .*|preload = $SELECTED_WALLPAPER|" \
           -e "s|wallpaper = ,.*|wallpaper = ,$SELECTED_WALLPAPER|" "$TARGET_FILE"
    sed -i -e "s|path = .*|path = $SELECTED_WALLPAPER|" "$TARGET_FILE2"
    
      killall hyprpaper
      hyprpaper

    # Reload Waybar to apply the new wal colors
    killall waybar
	  waybar
    
else
    echo "No wallpaper selected."
fi
