# Use official Microsoft SQL Server 2022 image
FROM mcr.microsoft.com/mssql/server:2022-latest

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Redg@te1

# Copy SQL script into container
COPY createdb.sql /tmp/createdb.sql

# Run script after SQL Server starts
CMD /bin/bash -c "/opt/mssql/bin/sqlservr & sleep 20 \
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -i /tmp/createdb.sql \
    && wait"
