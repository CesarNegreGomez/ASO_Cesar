$num = [int](Read-Host "Introduce un numero entero positivo")
$resultado = "" 

for ($i = 1; $i -le $num; $i++) {
    if ($i % 2 -ne 0) {
        $resultado = $resultado + "$i, "
    }
}

Write-Host "Numeros impares: $resultado"