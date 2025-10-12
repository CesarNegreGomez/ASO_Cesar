#!/bin/bash
if [ $# -ne 2 ]; then
    echo "Error: Deben indicarse exactamente 2 parametros."
    exit 1
fi

origen="$1"
destino="$2"

if [ ! -f "$origen" ]; then
    echo "Error: '$origen' no es un archivo regular."
    exit 1
fi

if [ -e "$destino" ]; then
    echo "Error: '$destino' ya existe."
    exit 1
fi

cp "$origen" "$destino"
echo "Archivo '$origen' copiado a '$destino'."