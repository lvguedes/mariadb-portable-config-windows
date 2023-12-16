# Loading the connector library

[System.Reflection.Assembly]::LoadFile("C:\Users\lucas.silva\Documents\POC Bradesco\portable\MySql.Data\v4.0_8.0.28.0__c5687fc88969c44d\MySql.Data.dll")

############################

# Connecting to the database

[string]$sMySQLUserName = 'root'
[string]$sMySQLPW = 'agr4321'
[string]$sMySQLDB = 'test'
[string]$sMySQLHost = 'localhost'
[string]$sConnectionString = "server="+$sMySQLHost+";port=3306;uid=" + $sMySQLUserName + ";pwd=" + $sMySQLPW + ";database="+$sMySQLDB

$oConnection = New-Object MySql.Data.MySqlClient.MySqlConnection($sConnectionString)
$Error.Clear()
try
{
    $oConnection.Open()
}
catch
{
    write-warning ("Could not open a connection to Database $sMySQLDB on Host $sMySQLHost. Error: "+$Error[0].ToString())
}

############################

# Querying

# Get an instance of all objects need for a SELECT query. The Command object
$oMYSQLCommand = New-Object MySql.Data.MySqlClient.MySqlCommand

# DataAdapter Object
$oMYSQLDataAdapter = New-Object MySql.Data.MySqlClient.MySqlDataAdapter

# And the DataSet Object 
$oMYSQLDataSet = New-Object System.Data.DataSet
 
# Assign the established MySQL connection
$oMYSQLCommand.Connection = $oConnection

# Define a SELECT query
$oMYSQLCommand.CommandText = 'SELECT peop_name,peop_state,peop_id from  `test`.`people` '
$oMYSQLDataAdapter.SelectCommand = $oMYSQLCommand

# Execute the query
$iNumberOfDataSets = $oMYSQLDataAdapter.Fill($oMYSQLDataSet, "data")

############################

# Processing the results

foreach($oDataSet in $oMYSQLDataSet.tables[0])
{
     write-host "Name:" $oDataSet.peop_name "`n" `
                "State:" $oDataSet.peop_state "`n" `
                "Id:" $oDataSet.peop_id 
}

############################

# Closing the connection

$oMySqlCommand.Connection.Close()