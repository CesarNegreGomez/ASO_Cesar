$salir = $false

do {
    Write-Host "---------- MENU ----------"
    Write-Host "a) Crear una carpeta"
    Write-Host "b) Crear un fichero nuevo"
    Write-Host "c) Cambiar el nombre de un fichero o carpeta"
    Write-Host "d) Borrar un archivo o carpeta"
    Write-Host "e) Verificar si existe un fichero o carpeta"
    Write-Host "f) Mostrar el contenido de un directorio"
    Write-Host "g) Mostrar la fecha y hora actuales"
    Write-Host "x) Salir"
    
    $opcion = Read-Host "Elige una opcion"

    switch ($opcion) {
        "a" { 
            $ruta = Read-Host "Nombre/Ruta de la nueva carpeta"
            New-Item -Path $ruta -ItemType Directory
        }
        "b" { 
            $ruta = Read-Host "Nombre/Ruta del nuevo fichero"
            New-Item -Path $ruta -ItemType File
        }
        "c" {
            $viejo = Read-Host "Ruta del archivo a renombrar"
            $nuevo = Read-Host "Nuevo nombre"
            Rename-Item -Path $viejo -NewName $nuevo
        }
        "d" {
            $ruta = Read-Host "Ruta del archivo a borrar"
            Remove-Item -Path $ruta -Recurse
            Write-Host "Borrado"
        }
        "e" {
            $ruta = Read-Host "Ruta a verificar"
            if (Test-Path $ruta) { 
                Write-Host "EXISTE" 
            }
            else { 
                Write-Host "NO EXISTE"
            }
        }
        "f" {
            $ruta = Read-Host "Ruta del directorio a listar"
            if (Test-Path $ruta) { 
                Get-ChildItem -Path $ruta 
            }
            else { 
                Write-Host "Ruta no valida" 
            }
        }
        "g" {
            Write-Host "Fecha y hora: $(Get-Date)"
        }
        "x" {
            $salir = $true
            Write-Host "Saliendo"
        }
        Default {
            Write-Host "Opcion erronea"
        }
    }
    Write-Host ""
} 
until ($salir -eq $true)