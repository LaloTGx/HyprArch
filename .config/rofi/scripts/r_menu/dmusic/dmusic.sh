#!/bin/bash

# -> COLORS
RED="\033[1;31m"
REDLIGHT="\e[1;91m"
YELLOW="\e[1;93m"
CYANLIGHT="\e[0;96m"
WHITELIGHT="\e[1;97m"
BGBLACK="\e[40m"
RESET="\033[0m"

# -> Path Script
TITLE_DIR="$HOME/.config/rofi/scripts/r_menu/dmusic"

show_title() {
  clear
  echo -e "${CYANLIGHT}"
  cat "$TITLE_DIR/titledmusic.txt"
  echo -e "${YELLOW}"
}

TARGET_DIR="$HOME/Music"

if [ ! -d "$TARGET_DIR" ]; then
    mkdir -p "$TARGET_DIR"
fi

search_music() {
    echo -e "${CYANLIGHT} Search Music${RESET}"
    read -p " Artist / 󰎈 Song Name: " query
    [[ -z "$query" ]] && return

    echo -e "${YELLOW}󱁐 Loading list...${RESET}"

    selected=$(yt-dlp --get-title --get-id --flat-playlist \
               --geo-bypass \
               "https://music.youtube.com/search?q=$query" | \
               head -n 60 | paste - - | \
               fzf --header="[j/k: Move | Enter: Select | ESC: Cancel]" \
                   --prompt="󰎈 Music Search: ")

    if [[ -n "$selected" ]]; then
        video_id=$(echo "$selected" | awk '{print $NF}')
        url="https://music.youtube.com/watch?v=$video_id"
        download_logic "$url"
    fi
}

download_logic() {
    local dl_url=$1
    echo -e "\n${YELLOW}󰇚 Select Format:${RESET}"
    echo "m) 󰸪 mp3 (Audio standard)"
    echo "f) 󰈣 flac (High quality)"
    read -p "Option [m/f]: " format_choice

    case $format_choice in
        m) ext="mp3" ;;
        f) ext="flac" ;;
        *) echo "Invalid. Defaulting to mp3..."; ext="mp3" ;;
    esac

    echo -e "${CYANLIGHT}󰇚 Downloading...${RESET}"

    yt-dlp -x --audio-format "$ext" --audio-quality 0 \
    --format "bestaudio/best" \
    --geo-bypass \
    --no-playlist \
    --add-metadata \
    --embed-thumbnail \
    --metadata-from-title "%(artist)s - %(title)s" \
    --replace-in-metadata "title" " \([^)]*\)" "" \
    --replace-in-metadata "title" " \[[^]]*\]" "" \
    --replace-in-metadata "title" "[^\x00-\x7F]+" "" \
    --replace-in-metadata "title" "  +" " " \
    -o "$TARGET_DIR/%(title)s.%(ext)s" \
    "$dl_url"

    command -v mpc >/dev/null && mpc update
    echo -e "${YELLOW}󰲸 Library updated!${RESET}"
    sleep 1
}

# -> MENU
while true; do
    clear
    show_title
    echo
    echo "--------------------------"
    echo "s)      Search Music"
    echo "u)      Paste URL manually"
    echo "q)      Quit"
    echo "--------------------------"
    echo -n " Select action: "

    read -n1 -s main_choice

    case $main_choice in
        s) search_music ;;
        u) echo -e "\n Paste URL manually (Press Enter to cancel)"
        read -p " > " manual_url
           [[ -n "$manual_url" ]] && download_logic "$manual_url" ;;
        q) echo " Quit"; exit 0 ;;
        *) echo "Invalid option" ; sleep 1 ;;
    esac
done
