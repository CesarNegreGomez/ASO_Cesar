$nombre = Read-Host "Introduce tu nombre: "
$sexo = Read-Host "Introduce tu sexo (M / H): "

if ( ($sexo -eq "M" -and $nombre -lt "M") -or ($sexo -eq "H" -and $nombre -gt "N") ) {
    Write-Host "Perteneces al GRUPO A"
}
else {
    Write-Host "Perteneces al GRUPO B"
}