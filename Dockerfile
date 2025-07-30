# Use official SQL Server image
FROM mcr.microsoft.com/mssql/server:2022-lts

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Redg@te1
ENV MSSQL_PID=Developer

EXPOSE 1433