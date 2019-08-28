$instance = 'Your instance'

$database_name = 'Your database name'

$serverInstance = New-Object ('Microsoft.SqlServer.Management.Smo.Server') "{$database_name}"

$db = $serverInstance.Databases['{$database_name}']

$result = $db.ExecuteWithResults("SELECT * FROM ...")

$result.Tables[0] | Format-Table
