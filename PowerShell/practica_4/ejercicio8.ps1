$num = [int](Read-Host "Introduce un numero entero")

for ($i = 1; $i -le $num; $i++) {
    $inicio = ($i * 2) - 1
    for ($j = $inicio; $j -ge 1; $j -= 2) {
        Write-Host "$j " -NoNewline
    }
    Write-Host ""
}