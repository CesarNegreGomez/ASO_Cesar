Ejercicio 24.
--------------
#!/bin/bash
dir="$1"

if [ ! -d "$dir" ]; then
    echo "Error: Debes indicar un directorio valido."
    exit 1
fi

ficheros=0
directorios=0

for item in "$dir"/*; do
    if [ -f "$item" ]; then
        ((ficheros++))
    elif [ -d "$item" ]; then
        ((directorios++))
    fi
done

echo "Ficheros: $ficheros"
echo "Subdirectorios: $directorios"