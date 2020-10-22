#!/bin/bash

# Requirements
# sudo apt install mysql-client-5.7

MYSQL_HOST='127.0.0.1'
MYSQL_PORT='3306'

MYSQL_USER='root'
MYSQL_PASSWORD='123'

# DB names to backup
MYSQL_DATABASES=(product sample01 sample02 )

# AWS S3
S3_BUCKET=db-backup
S3_PATH=/databases

DIR_BACKUP=$(dirname "$(readlink -f $0)")/backup
DATE_BACKUP=$(date +%Y-%m-%d"_"%H-%M-%S)

KEEP_NEWEST=3

# 1. Start export databases
echo "1. Start export databases"
for MYSQL_DATABASE in ${MYSQL_DATABASES[@]}; do
    echo "Exporting database ${MYSQL_DATABASE} ..."
    mkdir -p ${DIR_BACKUP}/${MYSQL_DATABASE}
    mysqldump -h ${MYSQL_HOST} -P ${MYSQL_PORT} -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} | gzip >${DIR_BACKUP}/${MYSQL_DATABASE}/${MYSQL_DATABASE}_${DATE_BACKUP}.sql.gz
done

# 2. Upload to s3
echo "2. Uploading to s3 ..."
for MYSQL_DATABASE in ${MYSQL_DATABASES[@]}; do
    aws s3 cp ${DIR_BACKUP}/${MYSQL_DATABASE}/${MYSQL_DATABASE}_${DATE_BACKUP}.sql.gz s3://${S3_BUCKET}${S3_PATH}/${MYSQL_DATABASE}/${MYSQL_DATABASE}_${DATE_BACKUP}.sql.gz
done

# 3.Remove old files
echo "3. Removing old files ..."
for MYSQL_DATABASE in ${MYSQL_DATABASES[@]}; do
    cd ${DIR_BACKUP}/${MYSQL_DATABASE} && ls -1tr | head -n -${KEEP_NEWEST} | xargs -d '\n' rm -f --

    # Clean s3
    S3_DIR_PATH="s3://${S3_BUCKET}${S3_PATH}/${MYSQL_DATABASE}/"
    aws s3 ls ${S3_DIR_PATH} | grep -v PRE | head -n -${KEEP_NEWEST} | while read -r line; do
        fileName=`echo $line|awk {'print $4'}`
        aws s3 rm "${S3_DIR_PATH}${fileName}"
    done
done
