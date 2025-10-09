Ejercicio 16.
--------------
#!/bin/bash
# For
suma=0
for i in {1..1000}; do
    suma=$((suma+i))
done
echo "Suma con for: $suma"

# While
suma=0
i=1
while [ $i -le 1000 ]; do
    suma=$((suma+i))
    i=$((i+1))
done
echo "Suma con while: $suma"

# Until
suma=0
i=1
until [ $i -gt 1000 ]; do
    suma=$((suma+i))
    i=$((i+1))
done
echo "Suma con until: $suma"