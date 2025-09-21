Ejercicio 14.
--------------
#!/bin/bash
if [ $# -lt 4 ]; then
    echo "Error. La sintaxis correcta es ./gestionusuarios.sh alta/baja nombre apellido1 apellido2 [grupo]"
    exit 1
fi

accion="$1"
nombre="$2"
ape1="$3"
ape2="$4"
grupo="$5"

id_usr="alu${ape1:0:2}${ape2:0:2}${nombre:0:1}"

if [ "$accion" == "alta" ]; then
    if [ -z "$grupo" ]; then
        groupadd "$id_usr"
        grupo="$id_usr"
    fi
    useradd -m -g "$grupo" "$id_usr"
    echo "Usuario $id_usr dado de alta en el grupo $grupo."
elif [ "$accion" == "baja" ]; then
    userdel -r "$id_usr"
    echo "Usuario $id_usr eliminado."
else
    echo "Error. La sintaxis correcta es ./gestionusuarios.sh alta/baja nombre apellido1 apellido2 [grupo]"
    exit 1
fi