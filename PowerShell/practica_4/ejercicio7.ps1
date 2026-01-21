$num = [int](Read-Host "Introduce un numero")

for ($i = 1; $i -le $num; $i++) {
    Write-Host ("*" * $i)
}