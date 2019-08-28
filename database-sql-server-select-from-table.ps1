$instance = 'Your instance name...'

$database_name = 'Your database name...'

$serverInstance = New-Object ('Microsoft.SqlServer.Management.Smo.Server') $instance

$db = $serverInstance.Databases[$database_name]

$result = $db.ExecuteWithResults("SELECT * FROM ...")

$result.Tables[0] | Format-Table
