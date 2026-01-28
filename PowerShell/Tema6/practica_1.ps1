# Importar el módulo
Import-Module ActiveDirectory

# 1. Crear la Unidad Organizativa principal
# El dominio es empresa.local, por eso se usa DC=empresa,DC=local
New-ADOrganizationalUnit -Name "Empresa" -Path "DC=empresa,DC=local"

# 2. Crear las OUs de los departamentos y sus grupos
# Usamos el delimitador ';' porque así vienen los archivos csv
$departamentos = Import-Csv "departamentos.csv" -Delimiter ';'

foreach ($linea in $departamentos) {
    $nombre = $linea.departamento
    $rutaEmpresa = "OU=Empresa,DC=empresa,DC=local"

    # Crear la sub-OU para el departamento
    New-ADOrganizationalUnit -Name $nombre -Path $rutaEmpresa
    
    # Crear el grupo global del departamento
    $rutaDept = "OU=$nombre,$rutaEmpresa"
    New-ADGroup -Name "G_$nombre" -GroupScope Global -Path $rutaDept
}

# 3. Crear los usuarios y meterlos en sus grupos
$empleados = Import-Csv "empleados.csv" -Delimiter ';'
$password = ConvertTo-SecureString "aso2025." -AsPlainText -Force

foreach ($persona in $empleados) {
    # Formato nombre.apellido en minúsculas
    $usuario = ($persona.nombre + "." + $persona.apellido).ToLower()
    $dept = $persona.departamento
    $rutaDestino = "OU=$dept,OU=Empresa,DC=empresa,DC=local"

    # Crear el usuario con los datos del CSV
    New-ADUser -Name $usuario `
               -SamAccountName $usuario `
               -Path $rutaDestino `
               -AccountPassword $password `
               -ChangePasswordAtLogon $true `
               -Enabled $true

    # Meter al usuario en su grupo
    Add-ADGroupMember -Identity "G_$dept" -Members $usuario
}