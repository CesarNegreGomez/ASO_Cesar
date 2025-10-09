#!/bin/bash

ARCHIVO="agenda.csv"

# Funcion para validar telefono
validar_telefono() {
    if [[ $1 =~ ^[0-9]{9}$ ]]; then
        return 0
    else
        return 1
    fi
}

# Funcion para validar email
validar_email() {
    if [[ $1 =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        return 0
    else
        return 1
    fi
}

# Funcion para el menu
imprimir_menu() {
    echo "=== AGENDA ==="
    echo "1) Añadir contacto"
    echo "2) Listar contactos"
    echo "3) Buscar contacto"
    echo "4) Borrar contacto"
    echo "5) Editar contacto"
    echo "6) Salir"
}

# Funcion para añadir contacto
añadir_contacto() {
    read -p "Nombre: " nombre
    read -p "Telefono: " telefono
    read -p "Email: " email
    
    # Validaciones
    if [[ -z "$nombre" ]]; then
        echo "Error: El nombre no puede estar vacío."
        return 1
    fi
    
    if ! validar_telefono "$telefono"; then
        echo "Error: Telefono invalido. Debe tener 9 digitos."
        return 1
    fi
    
    if ! validar_email "$email"; then
        echo "Error: Email invalido."
        return 1
    fi
    
    # Guardar en formato Nombre;Telefono;Email
    echo "$nombre;$telefono;$email" >> "$ARCHIVO"
    echo "Contacto añadido correctamente."
}

# Funcion para listar contactos
listar_contactos() {
    if [[ ! -f "$ARCHIVO" ]] || [[ ! -s "$ARCHIVO" ]]; then
        echo "La agenda esta vacia."
        return
    fi
    
    echo "=== LISTA DE CONTACTOS ==="
    echo "Nombre;Telefono;Email"
    echo "--------------------------"
    cat "$ARCHIVO"
}

# Funcion para buscar contacto
buscar_contacto() {
    if [[ ! -f "$ARCHIVO" ]] || [[ ! -s "$ARCHIVO" ]]; then
        echo "La agenda esta vacia."
        return
    fi
    
    read -p "Buscar (nombre, telefono o email): " criterio
    echo "=== RESULTADOS DE BUSQUEDA ==="
    grep -i "$criterio" "$ARCHIVO"
}

# Funcion para borrar contacto
borrar_contacto() {
    if [[ ! -f "$ARCHIVO" ]] || [[ ! -s "$ARCHIVO" ]]; then
        echo "La agenda esta vacia."
        return
    fi
    
    read -p "Introduce el nombre o telefono del contacto a borrar: " criterio
    
    # Buscar y mostrar coincidencias
    resultados=$(grep -i "$criterio" "$ARCHIVO")
    if [[ -z "$resultados" ]]; then
        echo "No se encontraron contactos que coincidan."
        return
    fi
    
    echo "Contactos encontrados:"
    echo "$resultados"
    read -p "¿Estás seguro de que quieres borrar estos contactos? (s/n): " confirmacion
    
    if [[ $confirmacion == "s" ]] || [[ $confirmacion == "S" ]]; then
        # Crear archivo temporal sin los contactos a borrar
        grep -iv "$criterio" "$ARCHIVO" > "$ARCHIVO.tmp"
        mv "$ARCHIVO.tmp" "$ARCHIVO"
        echo "Contactos borrados correctamente."
    else
        echo "Operación cancelada."
    fi
}

# Funcion para editar contacto
editar_contacto() {
    if [[ ! -f "$ARCHIVO" ]] || [[ ! -s "$ARCHIVO" ]]; then
        echo "La agenda esta vacia."
        return
    fi
    
    read -p "Introduce el nombre o telefono del contacto a editar: " criterio
    
    # Buscar contacto
    contacto=$(grep -i "$criterio" "$ARCHIVO")
    if [[ -z "$contacto" ]]; then
        echo "No se encontro el contacto."
        return
    fi
    
    # Si hay multiples resultados, mostrar todos
    num_resultados=$(echo "$contacto" | wc -l)
    if [[ $num_resultados -gt 1 ]]; then
        echo "Multiples contactos encontrados:"
        echo "$contacto"
        read -p "Introduce el telefono específico del contacto a editar: " telefono_especifico
        contacto=$(grep "$telefono_especifico" "$ARCHIVO")
        if [[ -z "$contacto" ]]; then
            echo "No se encontro el contacto con ese telefono."
            return
        fi
    fi
    
    echo "Contacto a editar: $contacto"
    
    # Extraer datos actuales
    IFS=';' read -r nombre_actual telefono_actual email_actual <<< "$contacto"
    
    # Solicitar nuevos datos
    read -p "Nuevo nombre [$nombre_actual]: " nombre_nuevo
    read -p "Nuevo telefono [$telefono_actual]: " telefono_nuevo
    read -p "Nuevo email [$email_actual]: " email_nuevo
    
    # Usar valores actuales si no se introducen nuevos
    nombre_nuevo=${nombre_nuevo:-$nombre_actual}
    telefono_nuevo=${telefono_nuevo:-$telefono_actual}
    email_nuevo=${email_nuevo:-$email_actual}
    
    # Validaciones
    if ! validar_telefono "$telefono_nuevo"; then
        echo "Error: Telefono invalido. Debe tener 9 digitos."
        return 1
    fi
    
    if ! validar_email "$email_nuevo"; then
        echo "Error: Email invalido."
        return 1
    fi
    
    # Reemplazar contacto
    nuevo_contacto="$nombre_nuevo;$telefono_nuevo;$email_nuevo"
    sed -i "s|$contacto|$nuevo_contacto|" "$ARCHIVO"
    echo "Contacto actualizado correctamente."
}

# Programa principal
main() {
    # Crear archivo si no existe
    touch "$ARCHIVO"
    
    while true; do
        imprimir_menu
        read -p "Elige una opcion: " opcion
        
        case $opcion in
            1) añadir_contacto ;;
            2) listar_contactos ;;
            3) buscar_contacto ;;
            4) borrar_contacto ;;
            5) editar_contacto ;;
            6) 
                echo "¡Hasta pronto!"
                exit 0
                ;;
            *)
                echo "Opcion no valida."
                ;;
        esac
        
        echo
    done
}

# Ejecutar programa principal
main