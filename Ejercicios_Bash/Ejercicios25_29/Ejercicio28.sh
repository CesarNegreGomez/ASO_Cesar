 #!/bin/bash

# Función que verifica si existe un fichero
existe() {
    local fichero=$1
    
    if [[ -f "$fichero" ]]; then
        echo "El fichero '$fichero' existe."
        return 0  # Existe
    else
        echo "El fichero '$fichero' no existe."
        return 1  # No existe
    fi
}

# Verificar que se pasó un parámetro
if [[ $# -eq 0 ]]; then
    echo "Error: Debes proporcionar el nombre de un fichero como parámetro."
    echo "Uso: $0 <nombre_fichero>"
    exit 1
fi

# Llamar a la función existe con el primer parámetro
if existe "$1"; then
    # Si el fichero existe, cambiar permisos a ejecutable solo para el propietario
    chmod u+x "$1"
    echo "Permisos cambiados: '$1' ahora es ejecutable para el propietario."
    
    # Mostrar los nuevos permisos
    echo "Permisos actuales:"
    ls -l "$1"
else
    echo "No se pueden cambiar los permisos porque el fichero no existe."
    exit 1
fi
