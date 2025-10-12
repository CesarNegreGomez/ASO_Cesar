#!/bin/bash
read -p "Introduce un numero: " num
if ((num % 2 == 0 )); then
        echo "El numero $num es PAR"
else
        echo "El numero $num es IMPAR"
fi