$num = [int](Read-Host "Introduce un numero entero positivo para la cuenta atras")

for ($i = $num; $i -ge 0; $i--) {
    if ($i -ne 0) {
        Write-Host "$i, " -NoNewline
    } 
    else {
        Write-Host "$i"
    }
}