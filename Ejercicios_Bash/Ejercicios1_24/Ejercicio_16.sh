#!/bin/bash
suma=0
for i in {1..1000}; do
    suma=$((suma+i))
done
echo "Suma con for: $suma"

suma=0
i=1
while [ $i -le 1000 ]; do
    suma=$((suma+i))
    i=$((i+1))
done
echo "Suma con while: $suma"

suma=0
i=1
until [ $i -gt 1000 ]; do
    suma=$((suma+i))
    i=$((i+1))
done
echo "Suma con until: $suma"