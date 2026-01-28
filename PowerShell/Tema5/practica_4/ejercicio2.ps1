$edad = [int](Read-Host "Introduce tu edad")

Write-Host "Has cumplido todos estos años"
for ($i = 1; $i -le $edad; $i++) {
    Write-Host "$i"
}