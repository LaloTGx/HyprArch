# ~/.bashrc
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
alias grep='grep --color=auto'
#El bash normal
# PS1='[\u@\h \W]\$ '

#---------------------------------

# COLORS ANSI BASH
# https://gist.github.com/JBlond/2fea43a3049b38287e5e9cefc87b2124
# https://dev.to/ifenna__/adding-colors-to-bash-scripts-48g4

# Icono de carpeta (Nerd Font)
ICON_CLOCK=""
ICON_USER="󰊠"
ICON_HOST="󰌢"
ICON_PATH=""

# Colores
COLOR_LINE="\[\e[1;92m\]"    # Verde Brillante
COLOR_LINEA="\[\e[1;32m\]"   # Verde
COLOR_LINEB="\[\e[1;30m\]"   # Negro

COLOR_BGCLOCK="\[\e[1;37m\]" # Blanco
COLOR_CLOCK="\[\e[1;97m\]"   # Blanco brillante

COLOR_BGUSER="\[\e[1;31m\]"  # Rojo
COLOR_USER="\[\e[1;91m\]"    # Rojo brillante

COLOR_BGHOST="\[\e[1;34m\]"  # Azul
COLOR_HOST="\[\e[94m\]"      # Azul brillante

COLOR_BGPATH="\[\e[1;33m\]"  # Amarillo
COLOR_PATH="\[\e[93m\]"      # Amarillo brillante

COLOR_ENTRY="\[\e[96m\]"     # cyan brillante
COLOR_RESET="\[\e[0m\]"      # Reset

PS1="   ${COLOR_LINEB}┏━${COLOR_LINEA}━━${COLOR_LINE}━━${COLOR_BGPATH}•${COLOR_PATH}•\n     ${COLOR_BGCLOCK}${ICON_CLOCK}${COLOR_CLOCK} \@ ${COLOR_BGHOST}${ICON_HOST} ${COLOR_HOST}\h ${COLOR_BGPATH}${ICON_PATH} ${COLOR_PATH}\w\n       ${COLOR_BGUSER}${ICON_USER} ${COLOR_USER}\u${COLOR_ENTRY}:${COLOR_RESET} "

# Necesitas Instalar Fastfetch para correr al inicio
fastfetch
