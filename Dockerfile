FROM mcr.microsoft.com/mssql/server:2022-latest

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Redg@te1
ENV MSSQL_PID=Developer

COPY createdb.sql /createdb.sql

CMD /bin/bash -c "/opt/mssql/bin/sqlservr & \
    sleep 30s && \
    /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'Redg@te1' -i /createdb.sql && \
    tail -f /dev/null"
