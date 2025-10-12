#!/bin/bash
read -p "Introduce dos numeros: " num1 num2
if [[ num1 -gt num2 ]]; then
        echo "$num1 es mayor que $num2"
elif  [[ num2 -gt num1 ]]; then
        echo "$num2 es mayor que $num1"
else
        echo "$num1 y $num2 son iguales"
fi
