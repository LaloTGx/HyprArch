# Atajos de NVIM

## Buscar y moverse entre coincidencias

`/palabra` → buscar hacia adelante.\
`?palabra` → buscar hacia atrás.\
`n` → siguiente coincidencia.\
`N` → coincidencia anterior.\
`*` → buscar la palabra bajo el cursor hacia adelante.\
`#` → buscar la palabra bajo el cursor hacia atrás.\
`:noh` → quitar resaltado de búsqueda.\
`g*` y `g#` → buscar coincidencias parciales (no palabra completa).

## Movimiento entre palabras y texto

`w` → saltar al inicio de la siguiente palabra.
`e` → saltar al final de la palabra actual.
`b` → saltar al inicio de la palabra anterior.
`ge` → saltar al final de la palabra anterior.
`0` → ir al inicio de la línea.
`^` → ir al primer carácter no vacío de la línea.
`$` → ir al final de la línea.
`gg` → ir al inicio del archivo.
`G` → ir al final del archivo.
`H` → ir a la parte superior de la ventana.
`M` → ir al medio de la ventana.
`L` → ir a la parte inferior de la ventana.

## Navegación por pantallas y párrafos

`Ctrl + d` → bajar media pantalla.
`Ctrl + u` → subir media pantalla.
`Ctrl + f` → avanzar una pantalla completa.
`Ctrl + b` → retroceder una pantalla completa.
`{` → saltar al inicio del párrafo anterior.
`}` → saltar al inicio del siguiente párrafo.

## Selección y edición

`v` → entrar en modo visual (selección de caracteres).
`V` → modo visual por línea.
`Ctrl + v` → modo visual por bloque/columnas.
`y` → copiar (yank).
`d` → cortar (delete).
`p` → pegar después del cursor.
`P` → pegar antes del cursor.

## Otros tips útiles

`.` → repetir la última acción.
`u` → deshacer.
`Ctrl + r` → rehacer.
`.` → repetir última acción de edición.
`:set number` → mostrar números de línea.
`:set relativenumber` → mostrar números relativos.
`zz` → centrar la línea actual en la pantalla.
