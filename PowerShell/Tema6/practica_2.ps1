# Creamos la carpeta principal
New-Item -Path "C:\" -Name "Empresa" -ItemType "Directory"

# Importamos el CSV
$departamentos = Import-Csv -Path "C:\Users\Administrador\Desktop\departamentos.csv" -Delimiter ";"

foreach ($linea in $departamentos) {
    $nombreDept = $linea.departamento
    $rutaCarpeta = "C:\Empresa\" + $nombreDept
    New-Item -Path $rutaCarpeta -ItemType "Directory"
}


# Permiso de lectura en la raíz para Usuarios del Dominio
$aclRaiz = Get-Acl "C:\Empresa"
$reglaRaiz = New-Object System.Security.AccessControl.FileSystemAccessRule("Usuarios del dominio", "ReadAndExecute", "ContainerInherit, ObjectInherit", "None", "Allow")
$aclRaiz.AddAccessRule($reglaRaiz)
Set-Acl "C:\Empresa" $aclRaiz

# Permisos para cada subcarpeta
foreach ($linea in $departamentos) {
    $nombreDept = $linea.departamento
    $rutaSub = "C:\Empresa\$nombreDept"
    $acl = Get-Acl $rutaSub

    # Quitamos la herencia
    $acl.SetAccessRuleProtection($true, $false)

    # Administradores: Control Total
    $admin = New-Object System.Security.AccessControl.FileSystemAccessRule("Administradores", "FullControl", "ContainerInherit, ObjectInherit", "None", "Allow")
    $acl.AddAccessRule($admin)

    # 2. El grupo del departamento: Modificar
    $nombreGrupo = "G_" + $nombreDept
    $reglaDept = New-Object System.Security.AccessControl.FileSystemAccessRule($nombreGrupo, "Modify", "ContainerInherit, ObjectInherit", "None", "Allow")
    $acl.AddAccessRule($reglaDept)

    # 3. Resto de departamentos: Lectura
    $lectura = New-Object System.Security.AccessControl.FileSystemAccessRule("Usuarios del dominio", "ReadAndExecute", "ContainerInherit, ObjectInherit", "None", "Allow")
    $acl.AddAccessRule($lectura)

    Set-Acl $rutaSub $acl
}

# Compartir la carpeta en red
New-SmbShare -Name "Empresa" -Path "C:\Empresa" -FullAccess "Usuarios del dominio"