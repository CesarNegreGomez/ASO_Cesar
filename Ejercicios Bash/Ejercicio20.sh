Ejercicio 20.
--------------
#!/bin/bash
num="$1"

if [ -z "$n" ]; then
    echo "Uso: $0 numero"
    exit 1
fi

if [ "$num" -lt 2 ]; then
    echo "$num NO es primo"
    exit 0
fi

for ((i=2; i<=n/2; i++)); do
    if (( num % i == 0 )); then
        echo "$num NO es primo"
        exit 0
    fi
done

echo "$num es primo"
