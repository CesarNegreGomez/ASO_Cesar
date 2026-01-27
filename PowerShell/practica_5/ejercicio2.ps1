$lista_alumnos = Import-Csv "usuarios.csv" 

Write-Host "--- LISTADO DE ALUMNOS ---"

foreach ($alumno in $lista_alumnos) {
    $nom = $alumno.nombre
    $ape = $alumno.apellidos
    $grp = $alumno.grupo

    Write-Host "El alumno $nom $ape pertenece al grupo $grp"
}