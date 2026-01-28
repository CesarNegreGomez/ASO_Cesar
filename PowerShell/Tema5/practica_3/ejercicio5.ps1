$ruta = Read-Host "Introduce la ruta de un fichero o carpeta: "

if (Test-Path $ruta) {
    Write-Host "La ruta EXISTE"
}
else {
    Write-Host "La ruta NO existe"
}