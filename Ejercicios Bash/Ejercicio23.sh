Ejercicio 23.
--------------
#!/bin/bash
dir="$1"

if [ ! -d "$dir" ]; then
    echo "Error: Debes indicar un directorio valido."
    exit 1
fi

count=0
for item in "$dir"/*; do
    if [ -L "$item" ]; then
        tipo="Enlace simbolico"
    elif [ -b "$item" ]; then
        tipo="Archivo de bloque"
    elif [ -c "$item" ]; then
        tipo="Archivo de caracter"
    elif [ -d "$item" ]; then
        tipo="Directorio"
    elif [ -f "$item" ]; then
        tipo="Fichero"
    else
        tipo="Otro"
    fi
    echo "$(basename "$item") - $tipo"
    ((count++))
done
echo "Total de entradas: $count"