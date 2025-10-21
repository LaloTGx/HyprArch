# ~/.bashrc
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
alias grep='grep --color=auto'
#El bash normal
# PS1='[\u@\h \W]\$ '

#---------------------------------
# Funcion para cambiar icono segun la hora
clock_icon() {
    local hour=$(date +%I)
    local ampm=$(date +%p)
    local icon color

       if [[ "$ampm" == "AM" ]]; then
        case "$hour" in
            12) color="\e[1;34m" ;;
            01) color="\e[1;36m" ;;
            02) color="\e[1;96m" ;;
            03) color="\e[1;92m" ;;
            04) color="\e[1;93m" ;;
            05) color="\e[1;33m" ;;
            06) color="\e[1;97m" ;;
            07) color="\e[1;97m" ;;
            08) color="\e[1;97m" ;;
            09) color="\e[1;97m" ;;
            10) color="\e[1;97m" ;;
            11) color="\e[1;97m" ;;
        esac
    else
        case "$hour" in
            12) color="\e[1;93m" ;;
            01) color="\e[1;33m" ;;
            02) color="\e[1;91m" ;;
            03) color="\e[1;31m" ;;
            04) color="\e[1;35m" ;;
            05) color="\e[1;94m" ;;
            06) color="\e[1;34m" ;;
            07) color="\e[1;34m" ;;
            08) color="\e[1;34m" ;;
            09) color="\e[1;34m" ;;
            10) color="\e[1;34m" ;;
            11) color="\e[1;34m" ;;
        esac
    fi
    # Icono según la hora)
    case "$hour" in
        12) icon="󱑖 " ;;
        01) icon="󱑋 " ;;
        02) icon="󱑌 " ;;
        03) icon="󱑍 " ;;
        04) icon="󱑎 " ;;
        05) icon="󱑏 " ;;
        06) icon="󱑐 " ;;
        07) icon="󱑑 " ;;
        08) icon="󱑒 " ;;
        09) icon="󱑓 " ;;
        10) icon="󱑔 " ;;
        11) icon="󱑕 " ;;
        *)  icon=" " ;;
    esac
    printf "${color}${icon}"
}
# Función para Git
git_iconpath() {
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        printf "\e[1;91m"
    fi
}
git_icon() {
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        echo " "
    fi
}
# Funcion para numero de carpetas y archivos
dir_summary() {
    local files=$(find . -maxdepth 1 -type f | wc -l)
    local dirs=$(find . -mindepth 1 -maxdepth 1 -type d | wc -l)
    echo "$dirs 󰈔 $files"
}
# Funcion para mostrar icono de cada proyecto
project_icon() {
    # Node.js
    if [ -f package.json ]; then
        printf "\e[1;92m "
    # Python
    elif [ -f requirements.txt ] || [ -d venv ] || [ -f pyproject.toml ]; then
        printf "\e[1;94m "
    # Unity
    elif [ -d Assets ] && [ -f ProjectSettings/ProjectVersion.txt ]; then
        printf "\e[1;97m "
    # Rust
    elif [ -f Cargo.toml ]; then
printf "\e[1;91m "
    # Java
    elif [ -f pom.xml ] || [ -d src ] && ls src/*.java &>/dev/null; then
        printf "\e[1;31m󰬷 "
    # Android Studio
    elif [ -f build.gradle ] || [ -f settings.gradle ] || [ -d app/src ]; then
        printf "\e[1;92m "
    # Web (HTML/CSS/JS)
    elif ls *.html *.css *.js *.ts *.vue *.svelte &>/dev/null; then
        printf "\e[1;94m󰖟 "
    # Scripts
    elif ls *.sh *.py *.rb *.pl &>/dev/null; then
        printf "\e[1;97m󰯁 "
    # Config
    elif [[ "$PWD" == *".config"* ]] || [[ "$PWD" == *"dotfiles"* ]]; then
        printf "\e[1;95m "

    fi
}
# Funcion para mostrar el icono por cada carpeta
dir_folder() {
    if [[ "$PWD" =~ [Mm]inecraft ]]; then
        printf "\e[1;92m󰍳 "

    elif [[ "$PWD" =~ [Pp]ictures ]]; then
        printf "\e[1;95m "

    elif [[ "$PWD" =~ [Dd]esktop ]]; then
        printf "\e[1;94m "

    elif [[ "$PWD" =~ [Dd]ocuments ]]; then
        printf "\e[1;97m󰂻 "

    elif [[ "$PWD" =~ [Dd]ownloads ]]; then
        printf "\e[1;96m "

    elif [[ "$PWD" =~ [Mm]usic ]]; then
        printf "\e[1;95m "

    elif [[ "$PWD" =~ [Pp]ublic ]]; then
        printf "\e[1;34m "

    elif [[ "$PWD" =~ [Rr]epos ]]; then
        printf "\e[1;91m "

    elif [[ "$PWD" =~ [Vv]ideos ]]; then
        printf "\e[1;95m "

    elif [[ "$PWD" == "$HOME" ]] || [[ "$PWD" == "$HOME/"* ]]; then
        printf "\e[1;94m "
    fi
}
#---------------------------------
# COLORS ANSI BASH
# https://gist.github.com/JBlond/2fea43a3049b38287e5e9cefc87b2124
# https://dev.to/ifenna__/adding-colors-to-bash-scripts-48g4

# Iconos Utilizados (Nerd Font y noto-emoji)
ICON_USER="󰊠 "
ICON_HOST="󰌢 "
ICON_PATH=" "
ICON_PATHR="󰪺 "
ICON_RESULT=" "
ICON_TERM=" "

# Colores
COLOR_LINE="\[\e[1;92m\]"      # Verde Brillante
COLOR_LINEA="\[\e[1;32m\]"     # Verde
COLOR_LINEB="\[\e[1;30m\]"     # Negro

COLOR_BGCLOCK="\[\e[1;37m\]"   # Blanco
COLOR_CLOCK="\[\e[1;97m\]"     # Blanco brillante

COLOR_BGUSER="\[\e[1;31m\]"    # Rojo
COLOR_USER="\[\e[1;91m\]"      # Rojo brillante

COLOR_BGHOST="\[\e[1;34m\]"    # Azul
COLOR_HOST="\[\e[1;94m\]"      # Azul brillante

COLOR_BGDOT="\[\e[1;35m\]"     # Magenta
COLOR_DOT="\[\e[1;95m\]"       # Magenta brillante

COLOR_BGPATH="\[\e[1;33m\]"    # Amarillo
COLOR_PATH="\[\e[1;93m\]"      # Amarillo brillante

COLOR_ENTRY="\[\e[1;96m\]"     # cyan brillante
COLOR_RESET="\[\e[0m\]"        # Reset

# Entrada de Comando
PS1="${COLOR_LINEB}┏━${COLOR_LINEA}━━━━━${COLOR_LINE}━━━━━${COLOR_BGPATH} •${COLOR_PATH}•\n\$(clock_icon)\@ ${COLOR_LINEA}${ICON_HOST}${COLOR_LINE}\h \$(dir_folder)\$(project_icon)${COLOR_BGPATH}\$(git_iconpath)${ICON_PATH}${COLOR_PATH}\$(git_iconpath)\$(dir_summary) \w\n  ${COLOR_LINEA}${ICON_USER}${COLOR_USER}\$(git_icon)${COLOR_LINE}\u${COLOR_PATH}:${COLOR_LINE} "
# Resultado del Comando
PS0="${COLOR_LINEB}┏━${COLOR_BGHOST}━━━━━${COLOR_HOST}━━━━━${COLOR_BGDOT} •${COLOR_DOT}• ${COLOR_USER}\n${ICON_RESULT}\# ${COLOR_DOT}${ICON_TERM}${COLOR_BGDOT}\s: \l${COLOR_HOST}\n"

# Necesitas Instalar Fastfetch para correr al inicio
fastfetch
