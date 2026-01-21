$pass_real = "contraseña"
$intento = ""

while ($intento -ne $pass_real) {
    $intento = Read-Host "Introduce la contraseña"
    if ($intento -ne $pass_real) {
        Write-Host "Intentalo de nuevo"
    }
}

Write-Host "Contraseña correcta"