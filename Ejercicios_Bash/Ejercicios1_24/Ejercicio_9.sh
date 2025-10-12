#!/bin/bash
echo "1) Sumar"
echo "2) Restar"
echo "3) Multiplicar"
echo "4) Dividir"
echo "==================="

read -p "Elige una opcion (1-4): " opcion
read -p "Introduce el primer numero: " num1
read -p "Introduce el segundo numero: " num2

case $opcion in
    1)
        resultado=$(echo "$num1 + $num2" | bc)
        echo "Resultado de la suma: $resultado"
        ;;
    2)
        resultado=$(echo "$num1 - $num2" | bc)
        echo "Resultado de la resta: $resultado"
        ;;
    3)
        resultado=$(echo "$num1 * $num2" | bc)
        echo "Resultado de la multiplicacion: $resultado"
        ;;
    4)
        # Comprobar división por cero
        if [ "$num2" = "0" ]; then
            echo "Error: division por cero"
        else
            resultado=$(echo "scale=2; $num1 / $num2" | bc)
            echo "Resultado de la division: $resultado"
        fi
        ;;
    *)
        echo "Opcion no valida."
        ;;
esac