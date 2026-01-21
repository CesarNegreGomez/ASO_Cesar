$pass_guardada = "contraseña"
$pass_usuario = Read-Host "Introduce la contraseña"

if ($pass_usuario -eq $pass_guardada) {
    Write-Host "La contraseña coincide"
}
else {
    Write-Host "Contraseña incorrecta"
}