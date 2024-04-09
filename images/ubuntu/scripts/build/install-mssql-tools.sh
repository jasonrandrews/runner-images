#!/bin/bash -e
################################################################################
##  File:  install-mssql-tools.sh
##  Desc:  Install MS SQL Server client tools (https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-setup-tools?view=sql-server-2017)
################################################################################

export ACCEPT_EULA=Y

# no arm64 support
exit 0

apt-get update
apt-get install -y mssql-tools unixodbc-dev
apt-get -f install
ln -s /opt/mssql-tools/bin/* /usr/local/bin/

invoke_tests "Tools" "MSSQLCommandLineTools"
