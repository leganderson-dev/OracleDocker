#!/bin/bash

# Wait for SQL Server to be ready
echo "Waiting for SQL Server to start..."
until /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'Redg@te1' -Q "SELECT 1" > /dev/null 2>&1; do
  sleep 1
done

echo "SQL Server is up. Restoring the database..."

# Run the restore command
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'Redg@te1' -Q "
RESTORE DATABASE [SSC_Dev]
FROM DISK = N'/var/opt/mssql/backups/SSC_Prod.bak'
WITH
  MOVE 'SSC_Prod' TO '/var/opt/mssql/data/SSC_Dev.mdf',
  MOVE 'SSC_Prod_log' TO '/var/opt/mssql/data/SSC_Dev_log.ldf',
  REPLACE;
"

echo "Restore completed successfully."
