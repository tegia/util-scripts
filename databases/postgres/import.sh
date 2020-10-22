#!/bin/bash

set -e

# DB info
DB_HOST='127.0.0.1'
DB_PORT='5432'
DB_USER='postgres'
DB_PASSWORD='123'
DB_NAME='demo'

BACKUP_FILE=$1

echo "Starting restore database ${DB_NAME} from file ${BACKUP_FILE}"
pg_restore -U ${DB_USER} -h ${DB_HOST} -p ${DB_PORT} -d ${DB_NAME} -1 ${BACKUP_FILE}
echo "Done!"

