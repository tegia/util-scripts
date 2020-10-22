#!/bin/bash

# sudo apt-get install postgresql-client
# Fix: cron use /usr/bin/local
#
# PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
# LD_LIBRARY_PATH=/usr/local/lib
#

set -e

# DB info
DB_HOST='127.0.0.1'
DB_PORT='5432'
DB_USER='postgres'
DB_PASSWORD='123'

# DB names to backup
DB_NAMES=(product sample01 sample02 )

# Keep number of backup file
KEEP_NEWEST=3

# Local folder backup config
DIR_BACKUP=$(dirname "$(readlink -f $0)")/backup
DATE_BACKUP=$(date +%Y-%m-%d"_"%H-%M-%S)

# AWS S3 backup config
USE_S3=false
S3_BUCKET=db-backup
S3_PATH=/databases


# 1. Start export databases
echo "Start export databases"
for DB_NAME in ${DB_NAMES[@]}; do
    echo "Exporting database ${DB_NAME} ..."
    mkdir -p ${DIR_BACKUP}/${DB_NAME}
    export PGPASSWORD=${DB_PASSWORD}; pg_dump -h "${DB_HOST}" -p "${DB_PORT}" -U ${DB_USER} -Fc -v -d ${DB_NAME} > ${DIR_BACKUP}/${DB_NAME}/${DB_NAME}_${DATE_BACKUP}.backup
done

# 2. Upload to s3
if [ "$USE_S3" = true ]
then
    echo "Uploading to s3 ..."
    for DB_NAME in ${DB_NAMES[@]}; do
        aws s3 cp ${DIR_BACKUP}/${DB_NAME}/${DB_NAME}_${DATE_BACKUP}.backup s3://${S3_BUCKET}${S3_PATH}/${DB_NAME}/${DB_NAME}_${DATE_BACKUP}.backup
    done
fi

# 3.Remove old files
echo "Removing old files ..."
for DB_NAME in ${DB_NAMES[@]}; do
    cd ${DIR_BACKUP}/${DB_NAME} && ls -1tr | head -n -${KEEP_NEWEST} | xargs -d '\n' rm -f --

    # Clean s3
    if [ "$USE_S3" = true ]
    then
        S3_DIR_PATH="s3://${S3_BUCKET}${S3_PATH}/${DB_NAME}/"
        aws s3 ls ${S3_DIR_PATH} | grep -v PRE | head -n -${KEEP_NEWEST} | while read -r line; do
            fileName=`echo $line|awk {'print $4'}`
            aws s3 rm "${S3_DIR_PATH}${fileName}"
        done
    fi
done
