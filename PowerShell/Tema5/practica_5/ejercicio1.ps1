
function Sumar {
    param(
        [double]$n1,
        [double]$n2
    )
    $sumar = $n1 + $n2
    Write-Host "La respuesta es $sumar"
}

function Restar {
    param(
        [double]$n1,
        [double]$n2
    )
    $restar = $n1 - $n2
    Write-Host "La respuesta es $restar"
}

function Multiplicar {
    param(
        [double]$n1,
        [double]$n2
    )
    $multiplicar = $n1 * $n2
    Write-Host "La respuesta es $multiplicar"
}

function Dividir {
    param(
        [double]$n1,
        [double]$n2
    )
    if ($n2 -ne 0) {
        $dividir = $n1 / $n2
        Write-Host "La respuesta es $dividir"
    } else {
        return "Error: No se puede dividir por cero."
    }
}

$salir = $false

do {
    Clear-Host
    Write-Host "****** CALCULADORA ********"
    Write-Host "1. Sumar"
    Write-Host "2. Restar"
    Write-Host "3. Multiplicar"
    Write-Host "4. Dividir"
    Write-Host "5. Salir"
    
    $opcion = Read-Host "¿Qué desea hacer? Elige una opción"

    if ($opcion -eq "5") {
        $salir = $true
        Write-Host "Saliendo..."
    } elseif ($opcion -in "1","2","3","4") {
        $n1 = [double](Read-Host "Introduce el primer número")
        $n2 = [double](Read-Host "Introduce el segundo número")

        Write-Host "----------------Resultado----------------"
        
        switch ($opcion) {
            "1" {
                Write-Host "Sumando $n1 y $n2 ..." 
                Sumar $n1 $n2

            }
            "2" {
                Write-Host "Restando $n1 y $n2 ..."
                Restar $n1 $n2 

            }
            "3" { 
                Write-Host "Multiplicando $n1 y $n2 ..."
                Multiplicar $n1 $n2 

            }
            "4" { 
                Write-Host "Dividiendo $n1 y $n2 ..."
                Dividir $n1 $n2 

            }
        }
        Write-Host "------------------------------------------"
        Pause
    } else {
        Write-Host "Opción no válida."
    }

} until ($salir -eq $true)