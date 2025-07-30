FROM mcr.microsoft.com/mssql/server:2022-latest

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Redg@te1
ENV MSSQL_PID=Developer

USER root  # <-- Add this line

# Install sqlcmd
RUN apt-get update && apt-get install -y curl gnupg apt-transport-https \
  && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
  && curl https://packages.microsoft.com/config/debian/12/prod.list > /etc/apt/sources.list.d/mssql-release.list \
  && apt-get update && ACCEPT_EULA=Y apt-get install -y mssql-tools unixodbc-dev \
  && ln -s /opt/mssql-tools/bin/sqlcmd /usr/bin/sqlcmd \
  && ln -s /opt/mssql-tools/bin/bcp /usr/bin/bcp \
  && apt-get clean

COPY ./restore.sh /restore.sh
RUN chmod +x /restore.sh

CMD /bin/bash /restore.sh
