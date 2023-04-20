#!/usr/bin/env bash

echo "Sleeping for 10 seconds to allow Maria DB to start..."
sleep 10;

echo "Setting alembic connection string to use env vars for sqlalchemy.url..."

INI_FILE="alembic.ini"
export CONN="sqlalchemy.url = mysql+pymysql\:\/\/${MYSQL_USER}\:${MYSQL_PASSWORD}\@${MYSQL_HOSTNAME}\:${MYSQL_PORT}\/${MYSQL_DATABASE}"

# back up original ini file for good measure
cp ${INI_FILE} ${INI_FILE}.bak
# replace the connection string with the new connection string
sed -i "s/sqlalchemy.url.*/$CONN/" ${INI_FILE}