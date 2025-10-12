#!/bin/bash
dir="$1"

if [ ! -d "$dir" ]; then
    echo "Error: Debes indicar un directorio valido."
    exit 1
fi

count=0
for item in "$dir"/*; do
    if [ -f "$item" ]; then
        echo "$(basename "$item") - Fichero"
    elif [ -d "$item" ]; then
        echo "$(basename "$item") - Directorio"
    fi
    ((count++))
done
echo "Total de entradas: $count"