#!/bin/bash

NOTES_DIR="$HOME/notes"
mkdir -p "$NOTES_DIR"

FILE="$1"

if [ -z "$FILE" ]; then
  FILE="$NOTES_DIR/$(date '+%Y-%m-%d').txt"
  touch "$FILE"
fi

clear

if [ -s "$FILE" ]; then
  cat "$FILE"
  echo
fi

while true; do
  TIME=$(date '+%H:%M')
  printf "[%s] -> " "$TIME"
  read LINE

  [[ "$LINE" == $'\e' ]] && exit 0

  echo "[$TIME] -> $LINE" >> "$FILE"
done
