#!/bin/bash

CACHE="/tmp/album-art.png"
LAST_ART="/tmp/album-art.path"
TEMP="/tmp/album-art.tmp.png"

MPD_ART="/tmp/mpd-album-art"
MPD_TMP="/tmp/mpd-album-art.tmp"

SPOTIFY_ART="/tmp/spotify-album-art"
SPOTIFY_TMP="/tmp/spotify-album-art.tmp"

PLACEHOLDER="$HOME/.config/waybar/assets/album-placeholder.png"

# Placeholder
fallback() {
    echo "$PLACEHOLDER"
    exit 0
}

# MPD
mpd_state=$(mpc status 2>/dev/null | awk '/^\[.*\]/ {print $1; exit}')

if [[ "$mpd_state" == "[playing]" ]]; then

    mpd_file=$(mpc -f "%file%" current 2>/dev/null)

    if [[ -n "$mpd_file" ]]; then

        if mpc readpicture "$mpd_file" > "$MPD_TMP" 2>/dev/null &&
           [[ -s "$MPD_TMP" ]]; then

            mv "$MPD_TMP" "$MPD_ART"

            current_art="mpd:$mpd_file"

            # La canción no cambió
            if [[ -f "$CACHE" && -f "$LAST_ART" ]] &&
               [[ "$(cat "$LAST_ART")" == "$current_art" ]]; then

                echo "$CACHE"
                exit 0
            fi

            # Procesar carátula
            if magick "$MPD_ART" \
                -auto-orient \
                -thumbnail "500x500^" \
                -gravity center \
                -extent 500x500 \
                \( +clone -alpha transparent \
                   -fill white \
                   -draw "roundrectangle 0,0 499,499,60,60" \
                \) \
                -compose DstIn \
                -composite \
                "$TEMP"; then

                mv "$TEMP" "$CACHE"
                printf '%s\n' "$current_art" > "$LAST_ART"

                echo "$CACHE"
                exit 0
            fi

            rm -f "$TEMP"
        fi

        rm -f "$MPD_TMP"
    fi
fi

# Spotify
spotify_status=$(playerctl -p spotify status 2>/dev/null)

if [[ "$spotify_status" == "Playing" ]]; then

    album_art=$(playerctl -p spotify metadata mpris:artUrl 2>/dev/null)

    if [[ -n "$album_art" ]]; then

        current_art="spotify:$album_art"

        # La carátula no cambió
        if [[ -f "$CACHE" && -f "$LAST_ART" ]] &&
           [[ "$(cat "$LAST_ART")" == "$current_art" ]]; then

            echo "$CACHE"
            exit 0
        fi

        rm -f "$SPOTIFY_TMP"

        # Carátula local
        if [[ "$album_art" == file://* ]]; then

            local_art="${album_art#file://}"

            if [[ -f "$local_art" ]]; then
                cp "$local_art" "$SPOTIFY_ART"
            fi

        # Carátula remota
        elif [[ "$album_art" == http://* || "$album_art" == https://* ]]; then

            if curl -fsSL "$album_art" -o "$SPOTIFY_TMP"; then
                mv "$SPOTIFY_TMP" "$SPOTIFY_ART"
            fi
        fi

        # Procesar carátula
        if [[ -f "$SPOTIFY_ART" && -s "$SPOTIFY_ART" ]]; then

            read -r width height < <(
                magick identify -format '%w %h' "$SPOTIFY_ART" 2>/dev/null
            )

            if [[ -n "$width" && -n "$height" ]]; then

                # Imagen cuadrada
                if [[ "$width" -eq "$height" ]]; then

                    if magick "$SPOTIFY_ART" \
                        \( +clone -alpha transparent \
                           -fill white \
                           -draw "roundrectangle 0,0 %[fx:w-1],%[fx:h-1],60,60" \
                        \) \
                        -compose DstIn \
                        -composite \
                        "$TEMP"; then

                        mv "$TEMP" "$CACHE"
                        printf '%s\n' "$current_art" > "$LAST_ART"

                        echo "$CACHE"
                        exit 0
                    fi

                # Imagen no cuadrada
                else

                    size=$(( width < height ? width : height ))
                    x=$(( (width - size) / 2 ))
                    y=$(( (height - size) / 2 ))
                    radius=$(( size / 4 ))

                    if magick "$SPOTIFY_ART" \
                        -crop "${size}x${size}+${x}+${y}" \
                        +repage \
                        \( +clone -alpha transparent \
                           -fill white \
                           -draw "roundrectangle 0,0 $((size - 1)),$((size - 1)),$radius,$radius" \
                        \) \
                        -compose DstIn \
                        -composite \
                        "$TEMP"; then

                        mv "$TEMP" "$CACHE"
                        printf '%s\n' "$current_art" > "$LAST_ART"

                        echo "$CACHE"
                        exit 0
                    fi
                fi
            fi
        fi
    fi
fi

# Placeholder
fallback
