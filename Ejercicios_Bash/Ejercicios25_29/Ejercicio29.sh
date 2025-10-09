#!/bin/bash

# Función para obtener información de la red
obtener_info_red() {
    echo "=== INFORMACIÓN DE LA RED ==="
    
    # Obtener interfaz de red principal
    interfaz=$(ip route | grep default | awk '{print $5}' | head -1)
    echo "Interfaz: $interfaz"
    
    # Obtener IP y máscara
    ip_info=$(ip addr show $interfaz | grep "inet " | awk '{print $2}')
    ip=$(echo $ip_info | cut -d'/' -f1)
    mascara_cidr=$(echo $ip_info | cut -d'/' -f2)
    
    echo "IP del equipo: $ip"
    echo "Máscara CIDR: /$mascara_cidr"
    
    # Calcular máscara de subred decimal
    calcular_mascara_decimal $mascara_cidr
    
    # Calcular dirección de red y broadcast
    calcular_direccion_red $ip $mascara_cidr
}

# Función para calcular máscara de subred en formato decimal
calcular_mascara_decimal() {
    local cidr=$1
    local mascara=""
    local bits_restantes=32
    
    for i in {1..4}; do
        if [ $cidr -ge 8 ]; then
            mascara+="255"
            cidr=$((cidr - 8))
            bits_restantes=$((bits_restantes - 8))
        elif [ $cidr -gt 0 ]; then
            octeto=$((256 - 2**(8 - $cidr)))
            mascara+="$octeto"
            bits_restantes=$((bits_restantes - $cidr))
            cidr=0
        else
            mascara+="0"
        fi
        
        if [ $i -lt 4 ]; then
            mascara+="."
        fi
    done
    
    echo "Máscara de subred: $mascara"
}

# Función para calcular dirección de red y broadcast
calcular_direccion_red() {
    local ip=$1
    local cidr=$2
    
    # Convertir IP a número decimal
    IFS='.' read -r i1 i2 i3 i4 <<< "$ip"
    ip_num=$(( (i1 << 24) + (i2 << 16) + (i3 << 8) + i4 ))
    
    # Calcular máscara en decimal
    mascara_num=$(( (0xFFFFFFFF << (32 - cidr)) & 0xFFFFFFFF ))
    
    # Calcular dirección de red
    red_num=$((ip_num & mascara_num))
    
    # Calcular broadcast
    broadcast_num=$((red_num | (~mascara_num & 0xFFFFFFFF)))
    
    # Convertir a formato IP
    red_ip=$(decimal_a_ip $red_num)
    broadcast_ip=$(decimal_a_ip $broadcast_num)
    
    echo "Dirección de red: $red_ip/$cidr"
    echo "Dirección broadcast: $broadcast_ip"
    
    # Calcular número de hosts
    hosts=$((2**(32 - cidr) - 2))
    echo "Número de hosts posibles: $hosts"
}

# Función para convertir decimal a IP
decimal_a_ip() {
    local decimal=$1
    echo "$(( (decimal >> 24) & 0xFF )).$(( (decimal >> 16) & 0xFF )).$(( (decimal >> 8) & 0xFF )).$(( decimal & 0xFF ))"
}

# Función para escanear IPs en la red
escanear_ips() {
    local ip=$1
    local cidr=$2
    local red_ip=$3
    
    echo ""
    echo "=== ESCANEANDO IPS EN LA RED ==="
    echo "Red: $red_ip/$cidr"
    echo ""
    
    # Extraer los primeros tres octetos de la red
    IFS='.' read -r o1 o2 o3 o4 <<< "$red_ip"
    base_ip="$o1.$o2.$o3"
    
    # Determinar rango de IPs a escanear basado en la máscara CIDR
    case $cidr in
        24)
            inicio=1
            fin=254
            ;;
        25)
            inicio=1
            fin=126
            ;;
        26)
            inicio=1
            fin=62
            ;;
        27)
            inicio=1
            fin=30
            ;;
        28)
            inicio=1
            fin=14
            ;;
        29)
            inicio=1
            fin=6
            ;;
        30)
            inicio=1
            fin=2
            ;;
        *)
            inicio=1
            fin=254
            ;;
    esac
    
    contador_libres=0
    contador_ocupadas=0
    
    echo "IP              ESTADO"
    echo "-----------------------"
    
    for i in $(seq $inicio $fin); do
        ip_actual="$base_ip.$i"
        
        # Hacer ping (1 paquete, timeout 1 segundo)
        if ping -c 1 -W 1 $ip_actual > /dev/null 2>&1; then
            echo "$ip_actual    OCUPADA"
            contador_ocupadas=$((contador_ocupadas + 1))
        else
            echo "$ip_actual    LIBRE"
            contador_libres=$((contador_libres + 1))
        fi
    done
    
    echo ""
    echo "=== RESUMEN ==="
    echo "IPs ocupadas: $contador_ocupadas"
    echo "IPs libres: $contador_libres"
    echo "Total escaneadas: $((contador_ocupadas + contador_libres))"
}

# Función principal
main() {
    echo "GENERADOR DE INFORME DE RED"
    echo "============================"
    
    # Obtener información de la red
    obtener_info_red
    
    # Escanear IPs (solo si es una red de clase C o similar)
    ip_info=$(ip route | grep default | awk '{print $9}' | head -1)
    if [[ -n "$ip_info" ]]; then
        IFS='.' read -r o1 o2 o3 o4 <<< "$ip_info"
        cidr=$(ip addr show $(ip route | grep default | awk '{print $5}' | head -1) | grep "inet " | awk '{print $2}' | cut -d'/' -f2)
        red_base="$o1.$o2.$o3"
        
        escanear_ips "$ip_info" "$cidr" "$red_base.0"
    else
        echo "No se pudo obtener la información de la red."
    fi
}

# Ejecutar función principal
main 
