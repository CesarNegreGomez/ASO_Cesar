$ruta = Read-Host "Introduce una ruta: "

if (Test-Path $ruta -PathType Container) {
    Write-Host "Es un directorio. Mostrando contenido:"
    Get-ChildItem -Path $ruta -Recurse
} 
else {
    Write-Host "No es un directorio o no existe."
}