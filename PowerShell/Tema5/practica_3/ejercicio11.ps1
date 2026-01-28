$edad = [int](Read-Host "Introduce tu edad: ")

if ($edad -lt 4) {
    Write-Host "Entrada GRATIS"
} 
elseif ($edad -le 18) {
    Write-Host "Precio de la entrada: 5€"
} 
else {
    Write-Host "Precio de la entrada: 10€"
}