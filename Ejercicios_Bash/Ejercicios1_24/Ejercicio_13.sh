Ejercicio 13.
--------------
#!/bin/bash
ARCHIVO="lista.txt"

while true; do
    echo "=== AGENDA ==="
    echo "1) Añadir"
    echo "2) Buscar"
    echo "3) Listar"
    echo "4) Ordenar"
    echo "5) Borrar"
    echo "6) Salir"
    read -p "Elige una opcion: " opcion

    case $opcion in
        1)
            read -p "Nombre: " nombre
            read -p "Direccion: " direccion
            read -p "Telefono: " telefono
            echo "$nombre,$direccion,$telefono" >> "$ARCHIVO"
            ;;
        2)
            read -p "Buscar (nombre, dirección o teléfono): " criterio
            grep -i "$criterio" "$ARCHIVO"
            ;;
        3)
            cat "$ARCHIVO"
            ;;
        4)
            sort "$ARCHIVO" -o "$ARCHIVO"
            echo "Archivo ordenado."
            ;;
        5)
            rm -f "$ARCHIVO"
            echo "Archivo borrado."
            ;;
        6)
            exit 0
            ;;
        *)
            echo "Opcion no valida."
            ;;
    esac
done
