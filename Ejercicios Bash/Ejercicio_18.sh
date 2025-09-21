Ejercicio 18.
--------------
#!/bin/bash
for i in {1..5}; do
    for j in $(seq 1 $i); do
        echo -n "$j"
    done
    echo
done