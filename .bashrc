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
ICON_USER=""
ICON_HOST="󰌢"
ICON_PATH=""

# Colores
COLOR_CLOCK="\[\e[1;97m\]"   # blanco brillante
COLOR_USER="\[\e[91m\]"      # rojo brillante
COLOR_HOST="\[\e[94m\]"      # cyan brillante
COLOR_PATH="\[\e[93m\]"      # amarillo brillante
COLOR_ENTRY="\[\e[92m\]"     # verde brillante
COLOR_RESET="\[\e[0m\]"

PS1="${COLOR_CLOCK}${ICON_CLOCK} \@ ${COLOR_USER}${ICON_USER} \u ${COLOR_HOST}${ICON_HOST} \h ${COLOR_PATH}${ICON_PATH} \w${COLOR_ENTRY}\n>${COLOR_RESET} "

# Necesitas Instalar Fastfetch para correr al inicio
fastfetch
