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

# Icono de carpeta (Nerd Font)
ICON_CLOCK=""
ICON_USER=""
ICON_HOST="󰌢"
ICON_PATH=""

# Colores
COLOR_CLOCK="\[\e[94m\]"   # azul brillante
COLOR_USER="\[\e[97m\]"   # blanco brillante
COLOR_HOST="\[\e[35m\]"   # cyan normal
COLOR_PATH="\[\e[93m\]"   # amarillo brillante
COLOR_RESET="\[\e[0m\]"

PS1="${COLOR_CLOCK}${ICON_CLOCK} \@ ${COLOR_USER}${ICON_USER} \u ${COLOR_HOST}${ICON_HOST} \h ${COLOR_PATH}${ICON_PATH} \w${COLOR_RESET}\n> "

# Necesitas Instalar Fastfetch para correr al inicio
fastfetch
