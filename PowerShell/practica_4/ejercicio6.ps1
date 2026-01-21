$secreto = 50

Write-Host "Adivina el numero (0-100)"

do {
    $intento = [int](Read-Host "Introduce un numero")

    if ($intento -lt $secreto) {
        Write-Host "El numero secreto es MAYOR"
    } elseif ($intento -gt $secreto) {
        Write-Host "El numero secreto es MENOR"
    }
} 
until ($intento -eq $secreto)

Write-Host "Enhorabuena, has adivinado el numero"