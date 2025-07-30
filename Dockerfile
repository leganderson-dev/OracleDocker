FROM mcr.microsoft.com/mssql/server:2022-latest

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Redg@te1

COPY createdb.sql /tmp/createdb.sql
COPY entrypoint.sh /usr/src/entrypoint.sh

USER root
RUN chmod +x /usr/src/entrypoint.sh

ENTRYPOINT ["/bin/bash", "/usr/src/entrypoint.sh"]
