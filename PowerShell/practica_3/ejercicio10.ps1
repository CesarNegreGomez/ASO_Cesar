$puntos = [double](Read-Host "Introduce tu puntuación (0.0, 0.4, 0.6 o mas): ")
$dinero_base = 2400

if ($puntos -eq 0.0) {
    $nivel = "Inaceptable"
} 
elseif ($puntos -eq 0.4) {
    $nivel = "Aceptable"
} 
elseif ($puntos -ge 0.6) {
    $nivel = "Meritorio"
} 
else {
    $nivel = "Puntuacion incorrecta"
    $puntos = 0
}

$total = $dinero_base * $puntos
Write-Host "Nivel: $nivel"
Write-Host "Beneficio: $total euros"