# Tutorial de personalizacion de Hyprland (desde mi proceso) :)
---
## Mirrorlist
Para poder instalar cualquier cosa se manejan por espejos que tambien parte de la comunidad son conocidos como
**servidores de replicas** que ayudan a tener un mejor cobertura para descargar lo que necesites en tu sistema
y puedes editarlo con el siguiente comando:\
`sudo nvim /etc/pacman.d/mirrorlist`\
dependiendo de tu zona puedes agregar el mirror mas conveniente o mas cercano. :)

<!-- por cierto este es listado de los servers oficiales mas rapidos segun la IA-->
<!--
Server = https://mirror.rackspace.com/archlinux/$repo/os/$arch
Server = https://mirror.rackspace.com/archlinux/$repo/os/$arch
Server = https://mirror.rackspace.com/archlinux/$repo/os/$arch
Server = https://mirror.math.princeton.edu/pub/archlinux/$repo/os/$arch
Server = https://mirror.chaotic.cx/archlinux/$repo/os/$arch
Server = https://mirror.archlinux.org/$repo/os/$arch

Espero te funcione :)
-->
---
## Conectarte a una red (WIFI/Ethernet)
En mi caso para mi es mas estable `sudo systemctl enable --now systemd-networkd` ya que en mi caso `networkmanager`
no tenia tan estable mi wifi a cada rato se iba y aveces no se conectaba a mi red de internet (ocuapaba `nmtui`).
entonces regrese mejor con `systemd-networkd` es mas estable pero tambien mas complejo por los comandos que llegues
a ocupar para conectarte a una red asi que para evitarte investigar sobre como conectarte aqui te doy los pasos
a seguir para que puedas conectarte a una red utilizando `iwd` con el `systemd-networkd`

* Para instarlo con pacman:\
`sudo pacman -S iwd`
* Para poder activar iwd:\
`sudo systemctl enable --now iwd`
* Para poder conectarte:\
`iwctl`
* Y te dara una informacion como este:
    ```
    iwctl
    NetworkConfigurationEnabled: enabled
    StateDirectory: /var/lib/iwd
    Version: 3.9
    ```

### Que pasa si lo tengo como **disabled**?
* Edita el archivo de iwd:\
`sudo nano /etc/iwd/main.conf`
* Luego le agregas esto dentro del archivo:
```
 [General]
 EnableNetworkConfiguration = true
 [Network]
 NameResolvingService = systemd
```
* Despues reiniciamos iwd:\
`sudo systemctl restart iwd`
* Y revisa el estado con:\
`iwctl`\
En mi caso esto me funciono y ya no tuves que realizar mas proceso para que el estado me muestre en **enable**

### Como conectarme a una red con iwd
Una vez dentro de `iwctl`
* Para escanear las redes wifi mas cercanas lo haces con:\
\[iwd\]\# `station wlan0 scan`
* Despues para visualizar las redes escaneadas te lo muestra con:\
\[iwd\]\# `station wlan0 get-networks`
* Para conectarte a tu red preferida lo haces con:\
\[iwd\]\# `station wlan0 connect TU_RED_WIFI`
* Y por ultimo para salirte de `iwd` es con:\
`exit`\
y con eso ya estarias conectado a tu red WIFI :)
---
## Git y SSH
Antes de comenzar creo que es muy importante aprender git por que en cualquier momento lo podrias
ocupar tanto para la programación como tambien para instalar o clonar algo de otros repositorios o de hasta tus
proyectos que hay en github.
* Para ello necesitas entrar a tu cuenta de **Github** con este comando:
`~`

### Camabio de URL a SSH
* Para cambiar del tipo de repositorio (como pasar url a pasar a SSH para una mejor comodidad) ejecutas lo siguiente:\
`git remote set-url origin git@github.com:Usuario/Repositorio.git`
* Para verficar si aun estas ocupando la URL o el SSH, ejecutas el siguiente comando:\
`git remote -v`

---
## Pacman
Bueno ya tienes instalado por defecto pacman (en el caso de arch)
* Asi que para instalar con **pacman** es:\
`sudo pacman -S (nombre del paquete)`
* Para desinstalar en mi caso ocupo este comando:\
`sudo pacman -Rns (nombre del paquete)`

### Activar Multilib para pacman
Al principio tenia duda de para que sirve **Multilib** pero es algo **(Opcional)** dependiendo de que quieras instalar
en tu sistema, lo que hace al menos desde mi opinion es correr software de **32bits** en tu sistema. Como veras el
sistema se maneja en dos versiones en **32bits** y en **64bits** casi la mayoria de ordenadores actuales manejan **64bits**
por lo tanto, lo que hace multilib es descargar las dos versiones para que te permita ejecutarlo como los videojuegos o
cualquier otro programa.

* Para poder activarlo necesitas ejecutar el siguiente comando:\
`sudo nvim /etc/pacman.conf`\
Puedes usar el editor de texto al que estas adaptado como **nano** o cualquier otro.

* Para poder activarlo solo busca en el documento **Multilib**:\
`[multilib]`\
`Include = /etc/pacman.d/mirrorlist`\
Lo descomentas y listo, ya podras descargar y ejecutar programas para los dos tipos de verisones, pero ojo por que tambien
puede ocupar un poco mas de almacenacienamiento pero si en tu caso tienes mucho almacenamiento esto no seria un problema. :)

## Yay
* Pero en el caso de yay lo primero que tienes que instalar es **base-devel**:\
`sudo pacman -S --needed base-devel git`
* Para despues instalar **yay**\
`git clone https://aur.archlinux.org/yay.git`\
`cd yay`\
`makepkg -si`
* En **yay** para instalar cualquier paquete es lo mismo que pacman aqui te muestro\
`yay -S (nombre del paquete)`\
`yay pacman -Rns (nombre del paquete)`

## Flatpak
* Para poder instalarlo debes ejecutar el siguiente comando:\
`sudo pacman -S flatpak`
* Despues reinicia la sesion para que se agreguen los cambios
* Para instalar **"La tienda" Flathub** ejecutas el siguiente comando:\
`sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo`
* Y listo puedes instalar cual app de flatpak usando este sintaxis:\
`flatpak install flathub com.project`
Espero poder haberte ayudado. :)

---
## Nvim
* Es un gran editor de texto (y es mucho mejor con sus plugins) pero antes de instalarlo debes instalar primero
`sudo pacman -S nodejs npm` estos dos son los encargados de descargar los plugins que vaya a ocupar.

* Despues de instalarlo ahora si ya puedes instalar nvim `sudo pacman -S nvim` y despues agregar los plugins que
para que te ayuden en tu rendimiento de escribir codigo tengo un poco de plugins en mi repo espero esto te sirva de
ayuda :)

---
## 7zip
* Es una herramienta poderosa para extraccion de archivos zip para instarlarlo solo necesitas del comando:\
`sudo pacman -S 7zip`
* Para extraer los documentos en la ruta actual donde estas usas este comando:\
`7z e (el archivo a descomprimir).zip`

---
## Skim
* Es una herramienta muy utilizado o almenos yo lo ocupo mucho, en el caso de que estes cansado de escribir:\
`cd /La/Ruta/`
* Si quieres ver el listado de tus directorios para abrir un archivo solo escribes:\
`sk`
* Y te muestra el listado de directorios a donde quieres ir para editar un archivo es un alivio si ya tienes muchos archivos y no recuerdas la ruta
Espero te sirva de ayuda. :)

---
## Fonts
* Si no tienes una carpeta destinada para los fonts lo crear asi:\
`mkdir ~/.local/share/fonts/`
* Una vez creado te vas a la ruta donde extraiste tu fuente y puedes copearlo asi:\
`cp *.otf ~/.local/share/fonts/` o si  gustas moverlo puedes remplazar `cp` por `mv`
* Para revisar si el font esta instalado puedes verlo con le siguiente comando:\
`fc-cache -fv`
* Para revisar un font en especifico usarias este comando:\
`fc-list | grep "CodeNewRoman"`\
Listo puedes ocuparlo en tu sistema anotando el nombre de la fuente en cualquier software que vayas a utilizar :)

---
## Hyprland
* Para configurar tus propias binds puedes editar en el siguiente archivo\
`nvim .config/hypr/hyprland.conf`
* Si descargaste mis dotfiles o la carpeta de hypr entonces puedes cambiarlo aqui\
`nvim .config/hypr/binds.conf`
* ya que lo dividi en subarchivos en el caso de que quieras modificar otra cosas puedes hacer\
`cd .config/hypr/`
* y con `ls` veras todos los archivos que quieras modificar con tu editor de texto preferido :)

### Monitores
* Para ver la lista de monitores ejecuta el siguiente comando:\
`hyprctl monitors`
* Despues instalas **wl-mirror** que es para duplicar tu pantalla a un **proyector con HDMI** ejecutando lo siguiente:\
`sudo pacman -S wl-mirror`
* Para verificar que lo tienes instalado solo ejecutas el siguiente comando:\
`which wl-mirror` y en la salida deberia mostrarte `/usr/sbin/wl-mirror`
* Para poder duplicar la pantalla lo harias de la siguiente manera:\
`wl-mirror --fullscreen-output HDMI-A-1 eDP-1`\
Donde **eDP-1** seria la pantalla de tu laptop y el **HDMI-A-1** el proyector al cual quieres proyectar para checar si es la
entrada deberias de ejecutar el comando: `hyprctl monitors` y listo con esto ya mostraria tu monitor en el proyector. :)

### Hyprsunset
De acuerdo con la documentacion de hyprland hyprsunset es el manejo de la temperatura de tu monitor
para evitar que tus ojos se cansen de ver mucho la pantalla para poder instalarlo es con este comando
`sudo pacman -S hyprsunset` tambien en la carpeta de "Hypr" te deje un archivo de configuracion para que modifiques
a la hora que se aplique el filtro o si quieres probarlo puedes intentarlo con el siguiente comando `hyprsunset -t 2500`
pero si ya tienes mi archivo corriendo deber hacer `pkill hyprsunset` antes para que pueda correr el primer comando ya que
primero verifica si ya tienes perfiles creados por lo que no te permite ejecutar sin antes eleminar ese proceso o tarea
pero tranqui obviamente no sera permantes solo sera en ese uso si reinicias otra vez se ejecutara los perfiles :)

---
## Waybar
En mi caso waybar siempre lo he tenido en
`cd /etc/xdg/waybar`,
he visto en otros rice o en reddit que lo tienen dentro de **.config**
asi que bueno si te descargas parte de mi rice quiero que sepa que siempre lo he tenido en esa ruta
en el caso de que tu quieras pasarlo a `cd .config/waybar` esta bien espero que tambien pueda funcionarte :)

En este caso para mi rice solo quiero dejarte con la parte de config.jscon y style.css si gustas hacerle
modificaciones puedes entrar y modificarlos archivos **config.jsonc** y **style.css**

### Si quieres agregarle scripts a waybar
como mostrarte el clima y pasaralo con una API o crear tu media player de spotify solo genera una carpeta:
`mkdir scripts` dentro de waybar,luego crea los archivos dentro de **scripts** con `touch script_example.sh`
espero te funcione y no dejes de crear :)

---
## Swaync
Para usar los botones de Swaync (sobre mi repositorio) debes tener instaladado **nmtui** tambien **blueman-manager**
y **copyq** tambien agreguè en el ultimo boton para tomar una captura pero necesitas instalarte **wl-copy** para que
te permita tomar screenshot a tu pantalla :)

* Para instalarlo con pacman:\
`sudo pacman -S swaync`
* Para acceder a la carpeta de swaync:\
`cd /etc/xdg/swaync`

---
## LSBLK
Es para ver tu almacenamiento quizas algun dia lo llegues a ocupar para ver como esta particionado tu
almacenamiento para ello solo necesitas ejecutar este codigo:\
`lsblk -o NAME,MODEL,SIZE,TYPE,MOUNTPOINT`\
espero te sirva de ayuda :)

---
## Montar una USB
Si algo que tendras que ver en linux es sobre como montar o como ver el contenido de tu **USB**, es un poco laborioso
pero no imposible.
* Para poder leer tu memoria usb necesitas ejecutar el siguiente comando:\
`sudo pacman -S exfatprogs ntfs-3g`\
Esto sirve para que acepte cualquier tipo de formato que tenga tu **USB**.
* Crea una carpeta donde puedas ver el contenido de **USB** ejecutando el comando:\
`sudo mkdir -p /mnt/usb`
* Para ver los **Dispositivos de bloques (almacenamiento)** ejecutas lo siguiente:\
`lsblk`\
Aqui podras identificar tu **USB** y tambien el almacenamiento de tu laptop.
* Una vez identificado el **USB** procedes a montarlo en mi caso su nombre era **"sdb"**\
`sudo mount /dev/sdb /mnt/usb`
* Para ver el contenido del usb montado se encontra en la carpeta **/mnt/usb** esta hasta la raiz **"/"** puedes verlo con
ls o tambien con tu explorador de archivos favorito.\
`ls /mnt/usb`
* Por ultimo despues de ver el contenido de tu **USB** y para desmontarlo de la manera correcta puedes ejecutar lo siguiente:\
`sudo umount /mnt/usb`\
Espero te sirva de ayuda para ver el contenido de tu **USB**. :)

---
## Rclone
Si alguna vez te has preocupado por si llegara a fallar tu SO y no hiciste un backup de tu informacion para esto funciona rclone
para que almacene tu informacion en tu drive (de la nube) favorita. puedes guardar en Google Drive, OneDrive, Dropbox, etc.
* Para instalarlo ejecuta el siguiente comando:\
`sudo pacman -S rclone`
* Para configurarlo y **agregar tu servicio de almacenamiento en la nube favorita** ejecutas el siguiente comando:\
` rclone config`
* Una vez configurado para subir tus documentos a tu **Drive** ejecutas el siguiente comando:\
`rclone copy ~/Documents gdrive:BackupDocuments -P`\
**Ojo** en mi caso solo quiero que una carpeta se almacene en mi **Drive**, puedes cambiar la ruta a tu gusto.
* **(Opcional):** Si quieres que haga cambios de tu computadora, por ejemplo si eliminas algun archivo local y tambien quieres
que se vea reflejado en tu **Drive** lo ejecutas con el siguiente comando:\
`rclone sync ~/Documents gdrive:BackupDocuments`

Por ultimo y mas importante **Rclone no sube automaticamente tus archivos** tienes que subirlo manualmente ejecutando:\
`rclone sync ~/Documents gdrive:BackupDocuments`\
Hay diferentes maneras de hacerlo de manera automatica con **Cron** o **Crontab**, tambien puedes haer un **Script** que ejecute
el comando cada cierto tiempo pero ya es tu creatividad de como resolverlo, por el momento y para mi caso lo hare manual.
Espero te sirva de ayuda para que no pierdas cosas importantes usando linux. :)

---
## Rust
* En el caso de que quieras programar en rust debes ejecutar lo siguiente:\
`sudo pacman -S rustup`
* En caso de usar nvim deberias instalar el lsp:\
`sudo pacman -S rust-analyzer`
* Para inicializarlo necesitas del comando:\
`rustup default stable`
* Para vericar si la instalacion fue correcta es con el siguiente comando:\
`rustc --version` y tambien `cargo --version`
* En donde **rustc** es el compilador y **cargo** es el gestor de proyectos, dependencias y la compilzación.

### Creacion de proyectos en rust
* Para crear un nuevo proyecto usaras el siguiente comando:\
`cargo new hola_rust`
* Despues te creará un directorio con lo necesario para ejecutar tu proyecto.
* Dentro del directorio para poder ejecutar tu proyecto, lo haras con el siguiente comando:\
`cargo run`

---
## Java
Para ejecutar java en tu computador y poder correrlo sin la necesidad de instalar un IDE (Netbeans o IntellijIdea).
* Primero necesitas instalar el jdk de esta manera:\
`sudo pacman -S jdk-openjdk`\
Con el comando descargara la ultima version de java.
* Para poder descargar una version especifica de java solo es necesario agregar el numero de version como el siguiente comando:\
`sudo pacman -S jdk17-openjdk`
* Para visualizar la version de java lo haces con el siguiente comando:\
`java -version`
* Para visualizar todas las versiones instaladas de java (en el caso de arch-linux) puedes usar el siguiente comando:\
`archlinux-java status`
* Para seleccionar la version de java lo haces con el siguiente comando:\
`sudo archlinux-java set java-21-openjdk`\
el 21 puedes cambiarlo es la version de java.
* Y para verificarlo utilizas el mismo comando:\
`archlinux-java status`
* Para seleccionar la version de java lo haces con el siguiente comando:\
* Despues de tener instalado java puedes crear una carpeta para tu proyecto.
* Luego puedes crear los archivos por ejemplo: `HolaMundo.java` y programarlo con tu editor de texto preferido.
* Para poder compilar tu codigo ejecutas el siguiente comando:\
`javac HolaMundo.java`
* Despues de compilarlo te deberia generar otro archivo `.class` (el bytecode)
* Por ultimo ya podras ejecutar el codigo con el siguiente comando:\
`java HolaMundo.java`

Por el momento aun no te puedo decir si se puede trabajar en proyectos grandes de java o el uso de SpringBoot pero si
te puedo decir que es bueno para los comienzos como hacer ejercicios de (hackerrank o leetcode). Espero que esta seccion te ayude. :)

---
## Referencias
<!-- Aqui mostrare las referencias que he estado ocupando -->
<!-- Si eres el autor de alguna pagina muchas gracias por todo -->
<!-- Obviamente tambien he llegado a utilizar IA pero hay cosas que prefiero verlo en las paginas web :) -->
### Links Generales
Este link me ayudo a escribir este Markdown:\
[MarkDown Guide](https://www.markdownguide.org/basic-syntax/)\
Este link es la documentacion de hyprland si quieres hacer algun cambio:\
[Hyprland Wiki](https://wiki.hypr.land/Configuring/)

### Links Especificos
Tambien busco por la wiki de arch, me funciona para poder entender un poco mas sobre el sistema aqui te dejo el listado
de links que tambien espero que sea de tu ayuda. :)\
[Mirrors](https://wiki.archlinux.org/title/Mirrors_(Espa%C3%B1ol))
