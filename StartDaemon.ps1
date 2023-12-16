# Starting the Daemon

# MariaDB bin directory path
$mdbPath = "%ConfigObj['Diretorios']['mariaDb']%"
$mdbPath = "C:\Users\lucas.silva\Documents\POC Bradesco\portable\mariadb-10.7.3-winx64\bin"
# CMD prompt Windows default path
$cmd = "C:\Windows\System32\cmd.exe"
# Database root dir path
$dbPath = "%ConfigObj['Diretorios']['db']%"
$dbPath = "C:\Users\lucas.silva\Documents\POC Bradesco\data\db"

if ($( $(Get-Process).Name | Select-String -Pattern mysqld ) -eq $null) {
    $argList = "-command & \""$mdbPath\mysqld.exe\"" --defaults-file=\""$dbPath\my.ini\"" --console"
    Start-Process powershell -ArgumentList $argList `                             -WindowStyle Minimized
    Start-Sleep -Seconds 5
}
