# Stage 1: Build sqlcmd tools in an Ubuntu base
FROM ubuntu:20.04 as tools

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y curl gnupg apt-transport-https \
  && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
  && curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list \
  && apt-get update && ACCEPT_EULA=Y apt-get install -y mssql-tools unixodbc-dev \
  && apt-get clean

# Stage 2: Build final SQL Server image
FROM mcr.microsoft.com/mssql/server:2022-latest

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Redg@te1

# Copy SQLCMD tools from previous stage
COPY --from=tools /opt/mssql-tools /opt/mssql-tools
COPY --from=tools /usr/bin/sqlcmd /usr/bin/sqlcmd
COPY --from=tools /usr/bin/bcp /usr/bin/bcp

# Copy backup file and restore script
COPY BKP/SSC.bak /var/opt/mssql/backup/SSC.bak
COPY restore.sh /restore.sh
RUN chmod +x /restore.sh

CMD [ "/bin/bash", "/restore.sh" ]
