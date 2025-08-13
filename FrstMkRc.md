# Tutorial de personalizacion de Hyprland (desde mi proceso)

## Pacman - Yay
Bueno ya tienes instalado por defecto pacman (en el caso de arch)

asi que para instalar con **pacman** es
'sudo pacman -S (nombre del paquete)'

y para desinstalar en mi caso ocupo este comando
'sudo pacman -Rns (nombre del paquete)'

en el caso de **yay** es lo mismo pero aqui te muestro como instalar yay
<!-- Aqui agregaria el comando de yay pero despues lo pongo -->
---
## 7z o 7zip
<!-- Aqui agregare como instalar 7zip -->
para extraer los documentos en la ruta actual donde estas usas este comando

'7z e (el archivo a descomprimir .zip)'
---

## Fonts
Si no tienes una carpeta destinada para los fonts lo crear asi
'mkdir ~/.local/share/fonts/'

Una vez creado te vas a la ruta donde extraiste tu fuente y puedes copearlo asi
'cp *.otf ~/.local/share/fonts/' o si  gustas moverlo puedes remplazar 'cp' por 'mv'

Para revisar si el font esta instalado puedes verlo con le siguiente comando
'fc-cache -fv'

Para revisar un font en especifico usarias este comando
'fc-list | grep "CodeNewRoman"'

Listo puedes ocuparlo en tu sistema anotando el nombre de la fuente en cualquier software que vayas a utilizar :)

---

## Hyprland

---

## Waybar
