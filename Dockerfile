# ============================
# Stage 1 - Build tools image
# ============================
FROM mcr.microsoft.com/mssql/server:2022-latest AS tools

USER root

# Install dependencies and sqlcmd
RUN apt-get update && apt-get install -y curl gnupg apt-transport-https \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/debian/12/prod.list > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update && ACCEPT_EULA=Y apt-get install -y mssql-tools unixodbc-dev \
    && apt-get clean

# =============================
# Stage 2 - Main MSSQL Image
# =============================
FROM mcr.microsoft.com/mssql/server:2022-latest AS final

ENV ACCEPT_EULA=Y
ENV MSSQL_SA_PASSWORD=Redg@te1
ENV MSSQL_PID=Developer

USER root

# Copy tools from builder stage
COPY --from=tools /opt/mssql-tools /opt/mssql-tools
COPY --from=tools /opt/mssql-tools/bin/sqlcmd /usr/bin/sqlcmd
COPY --from=tools /opt/mssql-tools/bin/bcp /usr/bin/bcp

# Copy restore script and backup file
COPY restore.sh /restore.sh
COPY SSC_Prod.bak /var/opt/mssql/backups/SSC_Prod.bak

RUN chmod +x /restore.sh

# Make sure the backup directory exists
RUN mkdir -p /var/opt/mssql/backups

# Run SQL Server and restore in background
CMD /bin/bash -c "/opt/mssql/bin/sqlservr & sleep 20 && /restore.sh && tail -f /dev/null"
