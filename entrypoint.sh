#!/bin/bash
# Start SQL Server in background
/opt/mssql/bin/sqlservr &

# Wait until it's ready to accept connections
echo "Waiting for SQL Server to be ready..."
for i in {1..30}; do
  /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'Redg@te1' -Q "SELECT 1" &>/dev/null
  if [ $? -eq 0 ]; then
    echo "SQL Server is ready!"
    break
  fi
  sleep 5
done

# Run the initialization script
echo "Running createdb.sql..."
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'Redg@te1' -i /tmp/createdb.sql

# Keep container alive
wait
