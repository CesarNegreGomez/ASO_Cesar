#!/bin/bash
suma=0
while true; do
    read -p "Introduce un numero (0 para terminar): " num
    if [ "$num" -eq 0 ]; then
        echo "La suma total es: $suma"
        break
    fi
    suma=$((suma + num))
done