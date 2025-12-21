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
## AMD
Para poder usar perfectamente el procesador que tienes (en este caso AMD)
* Necesitas instalar lo siguiente:\
`sudo pacman -S xf86-video-amdgpu`
* Y tambien lo importante (tambien en el caso de intel):\
`sudo pacman -S mesa`

---
## RTX
Para usar rtx (en mi caso es una 4050) al principio tenia problemas con **archinstall** asi que, si utilizas este componente cuando quieras instalarte arch linux con hyprland
selecciona el tipo en minimalista lo que hara sera instalarte arch linux normal (En vista TTY o terminal) y es normal de ahi en adelante usando la terminal instala lo necesario
que llegues a ocupar en tu dia a dia (en mi caso yazi, git, neovim, etc) para poder moverte con mayor facilidad desde la terminal despues puedes iniciar con el proceso
de instalacion de drivers para usar la rtx. :)
* Para instalar los drives necesitas de los siguientes comandos:
1. `sudo pacman -S linux-headers`
2. `sudo pacman -S nvidia-dkms` aunque si llegas a actualizar removera `nvidia-dkms` y te actualizara a uno mas actual `nvidia-open-dkms` a mi opinion llega a ser lo mismo, me funciona los dos.
3. `sudo pacman -S nvidia-utils`
4. `sudo pacman -S lib32-nvidia-utils`
5. `sudo pacman -S nvidia-settings`

**Advertencia:** Para instalar `lib32-nvdia-utils` **necesitas activar el repositorio Multilib** para ello ve al titulo de [PACMAN](#pacman) en el subtitulo [Activar Multilib para pacman](#activar-multilib-para-pacman)
te explico de manera rapida como activarlo solo tienes que descomentar dos lineas de codigo para que puedas descargarlo. :)

Hyprland necesita que el KMS (Kernel Mode Setting) este activo para Nvidia para ello necesitas editar en esta ruta:\
Dependiendo del Editor de texto que uses `sudo [nano]` o `sudo [nvim]`+`/etc/default/grub`

* En la linea GRUB_CMDLINE_LINUX_DEFAULT, añades lo siguiente:\
`nvidia-drm.modeset=1`
* Para regenerar el grub ejecutas el siguiente comando:
`sudo grub-mkconfig -o /boot/grub/grub.cfg`

* Para asegurar que los modulos se carguen al arrancar entra al archivo con el siguiente comando:\
`sudo nvim /etc/modules-load.d/nvidia.conf`
* Y escribe lo siguiente
```
nvidia
nvidia_modeset
nvidia_uvm
nvidia_drm
```
* **Es probable que tras agregar los modulos, deberias reinstalar otra vez los drivers para regenerar los archivos**
* **Nota:** Para mi futuro yo quizas no es necesario reinstalar los paquetes solo deberias ejecutar el siguiente comando:\
``sudo mkinitcpio -P``
* En el caso de que **No funcione** el comando anterior, entonces **si reinstala** los paquetes/drivers jaja

**// ------**
**// Tambien es necesario que despues de instalar y hacer los pasos anteriores deberas reiniciar tu computadora para que funcione :)**

* Para ver si se instalo correctamente puedes visualizarlo con lo siguiente:\
`nvidia-smi`

### NVIDIA-PRIME
* Para ejecutar cualquier aplicacion con la grafica RTX necesitas instalarte:\
`sudo pacman -S nvidia-prime`

* Para que la aplicacion abra con la tarjeta grafica necesitas ejecutar:\
`prime-run app` en donde **app** es el nombre de la aplicacion que quieres abrir.

**Nota:** digo que lo abra de esta manera ya que en mi caso uso una laptop que tiene grafica integrada AMD radeon graphics por lo que esa tarjeta se dedica a mostrar el escritorio
y la rtx se dedicaria a las aplicaciones pesadas. :)

---
## NVTOP
* Para ver el uso de la(s) tarjeta(s) puedes instalarte:\
`sudo pacman -S nvtop`
* Y verlo con el siguiente comando:\
`nvtop`

* **Despues ya podras seguir instalando tus demas instalaciones** como: hyprland, wayland, rofi, etc. :)
---
## HTOP
Esta herramienta funciona para ver el manejo de los nucleos del procesador y las tareas/aplicaciones que se estan ocupando en ese instante (tambien tareas secundarias)
* Para descargar la herramienta solo necesitas el siguiente comando:\
`sudo pacman -S htop`
* Para entrar y visualizar el contenido solo ejecutas el siguiente comando:\
`htop`

---
## Sobre repositorios SSH y Git
### SSH
Antes de comenzar creo que es muy importante aprender git por que en cualquier momento lo podrias
ocupar tanto para la programación como tambien para instalar o clonar algo de otros repositorios o de hasta tus
proyectos que hay en github.
* Para no entrar desde git sino desde ssh necesitar primero instalarte lo siguiente:\
`sudo pacman -S git openssh`
* Despues en tu carpeta `/~` lo conectas con este comando:\
`ssh-keygen -t ed25519 -C "tu_correo@ejemplo.com"`
* Para iniciar el SSH agent lo haces con lo siguiente:\
`eval "$(ssh-agent -s)"`\
`ssh-add ~/.ssh/id_ed25519`

### Vincular la llave SSH a Github
1. Deberas copear lo que te muestre con el siguiente comando:\
`cat ~/.ssh/id_ed25519.pub`
2. Entra a settings de Github (en mi caso lo abri en el navegador)
    1. Luego dirigete a SSH y GPG keys
        1. Crea un titulo para reconocer tu llave de tu dispositivo.
        2. En la seccion de key agrega el contenido que copeaste anteriormente
    2. Una vez agregado la llave te pedira una verificacion de que eres tu quien agrega esa llave
3. Ya podras usar ssh

### Verificacion
* Para confirmar si quedo todo perfecto ejecuta lo siguiente:\
`ssh -T git@github.com`

### Git
**Es necesario poder identificarte** tambien en git (para hacer commits, push, etc) con los siguientes comandos:
1. `git config --global user.name "Tu Nombre o Nick"`
2. `git config --global user.email "tu_email@ejemplo.com"`

### Cambio de URL a SSH
* Para cambiar del tipo de repositorio (como pasar url a pasar a SSH para una mejor comodidad) ejecutas lo siguiente:\
`git remote set-url origin git@github.com:Usuario/Repositorio.git`
* Para verficar si aun estas ocupando la URL o el SSH, ejecutas el siguiente comando:\
`git remote -v`

### Clonar repositorios de github
`git clone git@github.com:usuario/repositorio.git`

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

* Para sincronizar los repositorios ejecutas lo siguiente:\
`sudo pacman -Sy`

Y listo, ya podras descargar y ejecutar programas. :)

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
`fc-list | grep "CodeNewRoman"`
* Para mostrar iconos/emojis en la terminal necesitas instalarte:\
`sudo pacman -S noto-fonts-emoji`
* Para mostrar cualquier tipo de lenguaje o expresion matematica (para tu navegador) es necesario instalar lo siguiente:\
`sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-dejavu`
* Para poder pegar en tu campo de texto necesitas instalar lo siguiente:\
`sudo pacman -S wtype`\
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

### Lo mas importante y la razon por la cual te gustaria linux en general y mas especifico en Grub
* Esto me paso, un dia no me funcionaba dos teclas el dos y la "w" y mi contraseña esta el dos y sinceramente pense:\
"ya no voy a poder entrar a mi sistema" pero lo bueno de Grub es que desde el inicio cuando seleccionas el sistema\
te permite entrar como root asi normal y desde ahi pude cambiar mi contraseña y creo que esto es demasiado bueno aunque igual
peligroso por si te llegan a cambiar la contraseña... aunque bueno tendrias tu el control por que eres tu quien prende la\
computadora y accedes rapido. bueno te doy los comandos por si algun dia te quedas varado y esto te sirva de ayuda :)

Primero el Grub te muestra como:
* Arch linux
* advance options

Cuando estes en arch linux presionas `e` para entrar a la configuracion de entrada\
Despues te mostrara una lista de codigos que permite ejecutar tu Sistema Operativo (Segun la distro que hayas seleccionado)\
Y buscaras la siguiente linea de codigo:\
`linux /boot/vmlinuz-linux ...`\
Y al final de esa linea de codigo ingresa esto:\
`init=/bin/bash`\
Por ultimo para guardar presiona
`Crtl+` o igual `F10`\
De esta manera entraras al modo root cuando reinicie el dispositivo :)\
Ahora para montar donde se almacena las contraseñas escribe el siguente comando:\
`mount -o remount,rw /`\
Despues busca tu usuario para cambiar la contraseña con lo siguiente:\
`passwd <Usuario>`\
Luego te pedira tu nueva contraseña dos veces\
Ya por ultimo executa el siguiente comando para iniciar de nuevo con tu nueva contraseña
`exec /sbin/init`\
listo ya habras cambiado tu contraseña al entrar desde Grub :)

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

### Permisos para ejecución
* Para hacer que tu script se pueda ejecutar solo necesitas ejecutar este comando:
`chmod +x [la ruta de tu script (tipo de archivo .sh)]`
* Para revocar los permisos debes agregar el siguiente comando:
`chmod a-x [script]`\
Ahora si entramos en un poco especificos...
* Quita el permiso de ejecución a todos (user/group/others):
`chmod a-x`
* Quita solo al dueño (user):
`chmod u-x`
* Quita solo al grupo:
`chmod g-x`
* Quita solo a otros:
`chmod o-x`
Espero te funcione para que puedas ejecutar tus scripts. :)

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
* Ojo para poder enviar notificaciones debes instalarte aparte notify-send con este comando:\
`sudo pacman -S libnotify` para poder hacer test desde la terminal de tus notificaciones.
* Para acceder a la carpeta de swaync:\
`cd /etc/xdg/swaync`
---
## Matugen
Matugen recopila los colores de tu fondo de pantalla y te hace un listado de colores esto se complemente bastantae bien\
con `Swww` que permite cambiar de imagenes.
* Para poder instalarlo debes ejecutar el siguiente comando:\
`yay -S matugen`
* Para realizar pruebas con matugen necesitas ejecuta el siguiente comando:\
`matugen image /ruta/de/tu/imagen --show-colors`
* Con mi rice ya hasta el codigo para ejecutar en el script cuando se cambie de fondo de pantalla.
Espero te sirva de ayuda. :)

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

### Gradle
* Para correr tu estructura de gradle vas la inicio de tu proyecto y ejecutas el siguiente comando:\
`./gradlew clean run`

Por el momento aun no te puedo decir si se puede trabajar en proyectos grandes de java o el uso de SpringBoot pero si
te puedo decir que es bueno para los comienzos como hacer ejercicios de (hackerrank o leetcode). Espero que esta seccion te ayude. :)

---
## Android Studio
* Como sabras puedes instalarte la IDE de android studio con el siguiente comando:\
`yay -S android-studio`
* Despues si hay actualizaciones disponibles pero como no tiene privilegios te mandara este mensaje:\
`Studio does not have write access to /opt/android-studio. Please run it by a privileged user to update`
* Para poder solucionarlo solo necesitara cambiar los permisos de la carpeta opt para que android pueda actualizarse:\
`sudo chown -R $USER:$USER /opt/android-studio`
* Y listo con eso podras actualizar tu android studio sin problemas. :)

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
