#!/bin/bash
objetivo=42

while true; do
    read -p "Adivina el numero (1-100, 0 para rendirse): " num
    if [ "$num" -eq 0 ]; then
        echo "Te rendiste. El numero era $objetivo."
        break
    elif [ "$num" -eq "$objetivo" ]; then
        echo "¡Enhorabuena! Lo has adivinado."
        break
    elif [ "$num" -lt "$objetivo" ]; then
        echo "El numero es mayor."
    else
        echo "El numero es menor."
    fi
done