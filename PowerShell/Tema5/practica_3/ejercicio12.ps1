$tipo = Read-Host "¿Quieres una pizza vegetariana? (S/N)"

if ($tipo -eq "S") {
    Write-Host "Ingredientes disponibles: pimiento, tofu"
    $ing = Read-Host "Elige un ingrediente: "
    
    if ($ing -eq "pimiento" -or $ing -eq "tofu") {
        Write-Host "Has elegido una pizza VEGETARIANA"
        Write-Host "Ingredientes: mozzarella, tomate y $ing"
    } 
    else {
        Write-Host "Ingrediente incorrecto"
    }

} 
else {
    Write-Host "Ingredientes disponibles: peperoni, jamon, salmon"
    $ing = Read-Host "Elige un ingrediente: "
    
    if ($ing -eq "peperoni" -or $ing -eq "jamon" -or $ing -eq "salmon") {
        Write-Host "Has elegido una pizza NO VEGETARIANA"
        Write-Host "Ingredientes: mozzarella, tomate y $ing"
    } 
    else {
        Write-Host "Ingrediente incorrecto"
    }
}