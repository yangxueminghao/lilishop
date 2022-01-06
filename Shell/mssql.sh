# !/bin/bash
echo '开始启动mssql'
# Optional Environmental variables include:

# ACCEPT_EULA (Default=Y) SA_PASSWORD (Default =OcP2020123) MSSQL_PID (Default=Developer) MSSQL_AGENT_ENABLED (DEFAULT=True)
docker run -d -p 1433:1433 alexk002/sqlserver2019_demo:1
echo '启动完成'

