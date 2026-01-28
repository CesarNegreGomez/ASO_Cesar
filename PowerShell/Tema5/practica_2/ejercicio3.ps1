$horas = [double](Read-Host "Numero de horas trabajadas")
$coste = [double](Read-Host "Coste por hora")

$salario = $horas * $coste

Write-Host "El salario que debemos pagar es: $salario euros"