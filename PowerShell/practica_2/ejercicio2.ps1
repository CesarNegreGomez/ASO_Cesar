$num1 = [double](Read-Host "Introduce el primer numero")
$num2 = [double](Read-Host "Introduce el segundo numero")

$suma = $num1 + $num2
$resta = $num1 - $num2
$mult = $num1 * $num2
$div = $num1 / $num2
$resto = $num1 % $num2

Write-Host "Resultados:"
Write-Host "Suma: $suma"
Write-Host "Resta: $resta"
Write-Host "Multiplicacion: $mult"
Write-Host "Division: $div"
Write-Host "Resto: $resto"