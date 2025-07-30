#!/bin/bash

/opt/mssql/bin/sqlservr &

# Wait for SQL Server to start
sleep 30

sqlcmd -S localhost -U SA -P 'Redg@te1' \
  -Q "RESTORE DATABASE SSC_Dev FROM DISK = '/var/opt/mssql/backup/SSC.bak' WITH REPLACE, MOVE 'SSC' TO '/var/opt/mssql/data/SSC_Dev.mdf', MOVE 'SSC_log' TO '/var/opt/mssql/data/SSC_Dev_log.ldf'"

tail -f /dev/null
