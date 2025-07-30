#!/bin/bash

/opt/mssql/bin/sqlservr &

echo "Waiting for SQL Server to start..."
for i in {1..30}; do
  /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$SA_PASSWORD" -Q "SELECT 1" &>/dev/null
  if [ $? -eq 0 ]; then
    echo "SQL Server is ready."
    break
  fi
  sleep 2
done

echo "Running init script..."
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$SA_PASSWORD" -i /tmp/createdb.sql

wait
