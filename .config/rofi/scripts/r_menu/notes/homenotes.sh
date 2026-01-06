#!/usr/bin/env bash

REDLIGHT="\e[1;91m"
WHITELIGHT="\e[1;97m"
RESET="\033[0m"

NOTES_DIR="$HOME/notes"
SCRIPT_DIR="$HOME/.config/rofi/scripts/r_menu/notes"
NOTE_SCRIPT="$SCRIPT_DIR/note.sh"
TITLE_FILE="$SCRIPT_DIR/titlenote.txt"

mkdir -p "$NOTES_DIR"

get_notes() {
  mapfile -t NOTES < <(ls -1 "$NOTES_DIR" 2>/dev/null)
}

current=0

while true; do
  clear
  echo -e "${REDLIGHT}"
  cat "$TITLE_FILE"
  echo -e "${RESET}"

  get_notes

  if [ ${#NOTES[@]} -eq 0 ]; then
    echo "  (sin notas)"
  else
    for i in "${!NOTES[@]}"; do
      if [ "$i" -eq "$current" ]; then
        echo -e "${WHITELIGHT}> ${NOTES[$i]}${RESET}"
      else
        echo "  ${NOTES[$i]}"
      fi
    done
  fi

  echo
  echo "[Enter] Abrir | [a] Nueva | [j/k] Mover | [q] Salir"

  read -rsn1 key

  case "$key" in
    j) ((current++)); [ "$current" -ge "${#NOTES[@]}" ] && current=0 ;;
    k) ((current--)); [ "$current" -lt 0 ] && current=$((${#NOTES[@]} - 1)) ;;
    "")
      [ ${#NOTES[@]} -gt 0 ] && bash "$NOTE_SCRIPT" "$NOTES_DIR/${NOTES[$current]}"
      ;;
    a)
      bash "$NOTE_SCRIPT"
      ;;
    q)
      clear
      exit 0
      ;;
  esac
done
