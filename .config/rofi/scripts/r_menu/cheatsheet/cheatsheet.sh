#!/usr/bin/env bash

# Colores para texto
RED="\033[1;31m"
REDLIGHT="\e[1;91m"
YELLOW="\e[1;33m"
CYANLIGHT="\e[0;96m"
WHITELIGHT="\e[1;97m"
BGBLACK="\e[40m"
RESET="\033[0m"

# Rutas base
BASE_DIR="$HOME/.config/rofi/scripts/r_menu/cheatsheet"
PAGES_DIR="$BASE_DIR/pages"

# Mostrar título
show_title() {
  clear
  echo -e "${REDLIGHT}"
  cat "$BASE_DIR/titlecheat.txt"
}

# Mostrar página individual
show_page() {
  local page_file="$PAGES_DIR/$1.txt"
  if [[ -f "$page_file" ]]; then
    echo -e "${WHITELIGHT}"
    cat "$page_file"
    echo -e "${RESET}"
  else
    echo -e "${REDLIGHT}Error:${RESET} No se encontró el archivo '$page_file'"
  fi
}

# Función de búsqueda con selección de archivo
search_keyword() {
  echo
  echo -ne "${YELLOW}Buscar la pralabra: ${RESET}"
  read keyword
  clear
  show_title
  echo -e "${CYANLIGHT}Resultados para:${RESET} ${REDLIGHT}${keyword}${RESET}"
  echo

  # Buscar en qué archivos aparece la palabra
  mapfile -t matches < <(grep -ril "$keyword" "$PAGES_DIR")

  if [[ ${#matches[@]} -eq 0 ]]; then
    echo -e "${REDLIGHT}No se encontraron coincidencias.${RESET}"
    echo
    echo -e "${CYANLIGHT}Presiona cualquier tecla para volver...${RESET}"
    read -n1
    return
  fi

  echo -e "${YELLOW}${keyword}${RESET} se encuentra en los siguientes archivos:"
  for i in "${!matches[@]}"; do
    file_name=$(basename "${matches[$i]}" .txt)
    echo -e "  $((i+1)). ${WHITELIGHT}${file_name}${RESET}"
  done

  echo
  echo -e "${CYANLIGHT}Elige un número para abrir el archivo (o presiona Enter para cancelar): ${RESET}"
  read -n1 choice

  # Validar selección
  if [[ -z "$choice" ]]; then
    return
  elif [[ "$choice" =~ ^[0-9]+$ && $choice -ge 1 && $choice -le ${#matches[@]} ]]; then
    # Convertir el archivo seleccionado en nombre de page
    selected_file=$(basename "${matches[$((choice-1))]}" .txt)
    for i in "${!pages[@]}"; do
      if [[ "${pages[$i]}" == "$selected_file" ]]; then
        current_page=$((i+1))
        return
      fi
    done
  else
    echo -e "${REDLIGHT}Selección inválida.${RESET}"
    sleep 1
  fi
}

# Lista de páginas
declare -a pages=("systemlaunch" "windowfocus" "workspaces" "audiolight")
total_pages=${#pages[@]}

# Bucle principal
current_page=1
while true; do
  show_title
  show_page "${pages[$((current_page-1))]}"

  echo -e "${CYANLIGHT}Página ${current_page}/${total_pages}${RESET}"
  echo -e "[1-${total_pages}] Ir a página | [d] Siguiente | [a] Anterior | [/] Buscar | [q] Salir"
  read -n1 choice

  case $choice in
    [1-${total_pages}]) current_page=$choice ;;
    d|D)
      ((current_page++))
      [[ $current_page -gt $total_pages ]] && current_page=1
      ;;
    a|A)
      ((current_page--))
      [[ $current_page -lt 1 ]] && current_page=$total_pages
      ;;
    /)
      search_keyword
      ;;
    q|Q)
      clear
      exit 0
      ;;
  esac
done

