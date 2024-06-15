#!/bin/bash
DB_NAME=newdb
DB_USER=postgres
DB_PASS=admin

BUCKET_NAME=mypostgresqlbackup

TIMESTAMP=$(date +%F_%T | tr ':' '-')
TEMP_FILE=$(mktemp tmp.XXXXXXXXXX)
S3_FILE="s3://$BUCKET_NAME/backup-$TIMESTAMP"

PGPASSWORD=$DB_PASS pg_dump -Fc --no-acl -h localhost -U $DB_USER $DB_NAME > $TEMP_FILE
s3cmd put $TEMP_FILE $S3_FILE
rm "$TEMP_FILE"
