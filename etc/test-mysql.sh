#!/usr/bin/env bash

# ultra simple connectivity test script
# if no command line arguments are specified, use milestones db and credentials
# if anything is specified, use root

if [ $# -eq 0 ]; then
    USER="pizza"
    PASSWORD="pizza"
    DATABASE="pizza"
else 
    USER="root"
    PASSWORD="password"
    DATABASE="mysql"
fi

MYSQL_CLIENT=/usr/bin/mysql
if test -x "$MYSQL_CLIENT"; then
    echo "Testing connecting to MariaDB from a container"    
    HOST="mariadb"
else
    echo "Testing connecting to MariaDB from Mac OS"    
    MYSQL_CLIENT=/opt/homebrew/opt/mysql-client/bin/mysql
    HOST="127.0.0.1"
fi

echo "Connecting to MySQL using these values:"
echo "Binary:  ${MYSQL_CLIENT}"
echo "Host ${HOST}"
echo "User ${USER}"
echo "Password ${PASSWORD}"
echo "Database ${DATABASE}"

${MYSQL_CLIENT} \
    --host=${HOST} \
    --user=${USER} \
    --password=${PASSWORD} \
    ${DATABASE}