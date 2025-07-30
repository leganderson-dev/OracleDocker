FROM mcr.microsoft.com/mssql/server:2022-latest

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Redg@te1

# Copy the SQL script into the container
COPY createdb.sql /init/createdb.sql

# Start SQL Server and run the SQL script
CMD /bin/bash -c "\
  /opt/mssql/bin/sqlservr & \
  echo 'Waiting for SQL Server to start...'; \
  sleep 20; \
  until /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'Redg@te1' -Q 'SELECT 1' > /dev/null 2>&1; do \
    echo 'Still waiting...'; sleep 2; \
  done; \
  echo 'Running init script...'; \
  /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'Redg@te1' -i /init/createdb.sql; \
  tail -f /dev/null"
