$numero = [int](Read-Host "Introduce un numero: ")

if ($numero % 2 -eq 0) {
    Write-Host "El numero $numero es PAR"
} 
else {
    Write-Host "El numero $numero es IMPAR"
}