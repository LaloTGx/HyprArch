# Tutorial de personalizacion de Hyprland (desde mi proceso) :)
---
## Mirrorlist
Para poder instalar cualquier cosa se manejan por espejos y puedes editarlo con el siguiente comando
`sudo nvim /etc/pacman.d/mirrorlist`
dependiendo de tu zona puedes agregar el mirror

---
## Pacman - Yay
Bueno ya tienes instalado por defecto pacman (en el caso de arch)

asi que para instalar con **pacman** es...
`sudo pacman -S (nombre del paquete)`

y para desinstalar en mi caso ocupo este comando:
`sudo pacman -Rns (nombre del paquete)`

pero en el caso de yay lo primero que tienes que instalar es **base-devel**
`sudo pacman -S --needed base-devel git`

para despues instalar **yay**
`git clone https://aur.archlinux.org/yay.git`
`cd yay`
`makepkg -si`

En **yay** para instalar cualquier paquete es lo mismo que pacman aqui te muestro
`yay -S (nombre del paquete)`
`yay pacman -Rns (nombre del paquete)`

---
## 7zip
para extraer los documentos en la ruta actual donde estas usas este comando:
`7z e (el archivo a descomprimir).zip`

---
## Fonts
Si no tienes una carpeta destinada para los fonts lo crear asi:
`mkdir ~/.local/share/fonts/`

Una vez creado te vas a la ruta donde extraiste tu fuente y puedes copearlo asi:
`cp *.otf ~/.local/share/fonts/` o si  gustas moverlo puedes remplazar `cp` por `mv`

Para revisar si el font esta instalado puedes verlo con le siguiente comando:
`fc-cache -fv`

Para revisar un font en especifico usarias este comando:
`fc-list | grep "CodeNewRoman"`

Listo puedes ocuparlo en tu sistema anotando el nombre de la fuente en cualquier software que vayas a utilizar :)

---
## Hyprland
Para configurar tus propias binds puedes editar en el siguiente archivo
`nvim .config/hypr/hyprland.conf`
Si descargaste mis dotfiles o la carpeta de hypr entonces puedes cambiarlo aqui
`nvim .config/hypr/binds.conf`
ya que lo dividi en subarchivos en el caso de que quieras modificar otra cosas puedes hacer
`cd .config/hypr/`
y con `ls` veras todos los archivos que quieras modificar con tu editor de texto preferido :)

---
## Waybar
En mi caso waybar siempre lo he tenido en
`cd /etc/xdg/waybar`
he visto en otros rice o en reddit que lo tienen dentro de **.config**
asi que bueno si te descargas parte de mi rice quiero que sepa que siempre lo he tenido en esa ruta
en el caso de que tu quieras pasarlo a `cd .config/waybar` esta bien espero que tambien pueda funcionarte :)

En este caso para mi rice solo quiero dejarte con la parte de config.jscon y style.css si gustas hacerle 
modificaciones puedes entrar y modificarlos archivos **config.jsonc** y style.css

### Si quieres agregarle scripts a waybar
como mostrarte el clima y pasaralo con una API o crear tu media player de spotify solo genera una carpeta:
`mkdir scripts` dentro de waybar 
luego crea los archivos dentro de **scripts** con `touch script_example.sh`
espero te funcione y no dejes de crear :)

---
## Referencias
<!-- Aqui mostrare las referencias que he estado ocupando -->
<!-- Si eres el autor de alguna pagina muchas gracias por todo -->
<!-- Obviamente tambien he llegado a utilizar IA pero hay cosas que prefiero verlo en las paginas web :) -->
Este link me ayudo a escribir este Markdown:
[MarkDown Guide](https://www.markdownguide.org/basic-syntax/)

Este link es la documentacion de hyprland si quieres hacer algun cambio:
[Hyprland Wiki](https://wiki.hypr.land/Configuring/)
