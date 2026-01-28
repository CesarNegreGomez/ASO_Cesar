Write-Host "****** CALCULADORA ********"
Write-Host "1. Sumar"
Write-Host "2. Restar"
Write-Host "3. Multiplicar"
Write-Host "4. Dividir"

$opcion = Read-Host "Elige una opcion (1-4)"

switch ($opcion) {
    "1" {
        $n1 = [double](Read-Host "Introduce el primer numero: ")
        $n2 = [double](Read-Host "Introduce el segundo numero: ")
        Write-Host "Resultado: $($n1 + $n2)" 
    }
    "2" { 
        $n1 = [double](Read-Host "Introduce el primer numero: ")
        $n2 = [double](Read-Host "Introduce el segundo numero: ")
        Write-Host "Resultado: $($n1 - $n2)" 
    }
    "3" { 
        $n1 = [double](Read-Host "Introduce el primer numero: ")
        $n2 = [double](Read-Host "Introduce el segundo numero: ")
        Write-Host "Resultado: $($n1 * $n2)" 
    }
    "4" { 
        if ($n2 -ne 0) {
            $n1 = [double](Read-Host "Introduce el primer numero: ")
            $n2 = [double](Read-Host "Introduce el segundo numero: ") 
            Write-Host "Resultado: $($n1 / $n2)" 
        } 
        else { 
            Write-Host "No se puede dividir por cero" 
        } 
    }
    Default { Write-Host "Opcion no valida" }
}