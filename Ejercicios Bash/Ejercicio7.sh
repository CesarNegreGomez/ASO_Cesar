Ejercicio 7.
--------------
#!/bin/bash
read -p "Introduce el nombre del directorio que quieres comprimir: " dir
fecha=$(date +%F)
tar -czf "${fecha}-$(basename "$dir").tar.gz" "$dir"