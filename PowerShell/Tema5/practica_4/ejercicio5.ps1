
$num = [int](Read-Host "Introduce un numero para ver su tabla")

Write-Host "Tabla del $num"
for ($i = 1; $i -le 10; $i++) {
    $res = $num * $i
    Write-Host "$num x $i = $res"
}