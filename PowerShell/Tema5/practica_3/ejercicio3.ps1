$num1 = [int](Read-Host "Introduce el primer numero")
$num2 = [int](Read-Host "Introduce el segundo numero")

if ($num1 -gt $num2) {
    Write-Host "El $num1 es MAYOR que $num2"
}
elseif ($num1 -lt $num2) {
    Write-Host "El $num1 es MENOR que $num2"
}
else {
    Write-Host "Ambos numeros son IGUALES"
}