FROM mcr.microsoft.com/mssql/server:2022-latest

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Redg@te1

# Install sqlcmd
RUN apt-get update && apt-get install -y curl gnupg apt-transport-https \
  && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
  && curl https://packages.microsoft.com/config/debian/12/prod.list > /etc/apt/sources.list.d/mssql-release.list \
  && apt-get update && ACCEPT_EULA=Y apt-get install -y mssql-tools unixodbc-dev \
  && ln -s /opt/mssql-tools/bin/sqlcmd /usr/bin/sqlcmd \
  && ln -s /opt/mssql-tools/bin/bcp /usr/bin/bcp \
  && apt-get clean

# Copy the backup into the container
COPY BKP/SSC.bak /var/opt/mssql/backup/SSC.bak

# Restore the database on container startup
CMD /opt/mssql/bin/sqlservr & \
    sleep 30 && \
    sqlcmd -S localhost -U SA -P 'Redg@te1' \
      -Q "RESTORE DATABASE SSC_Dev FROM DISK = '/var/opt/mssql/backup/SSC.bak' WITH REPLACE, MOVE 'SSC' TO '/var/opt/mssql/data/SSC_Dev.mdf', MOVE 'SSC_log' TO '/var/opt/mssql/data/SSC_Dev_log.ldf'" \
    && tail -f /dev/null
