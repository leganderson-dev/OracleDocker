FROM mcr.microsoft.com/mssql/server:2022-latest

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Redg@te1

COPY BKP/SSC.bak /var/opt/mssql/backup/SSC.bak

# Restore the database after SQL Server starts
CMD /opt/mssql/bin/sqlservr & \
    sleep 30 && \
    /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Redg@te1" \
    -Q "RESTORE DATABASE SSC_Dev FROM DISK = '/var/opt/mssql/backup/SSC.bak' WITH REPLACE, MOVE 'SSC' TO '/var/opt/mssql/data/SSC.mdf', MOVE 'SSC_log' TO '/var/opt/mssql/data/SSC_log.ldf'" && \
    tail -f /dev/null
