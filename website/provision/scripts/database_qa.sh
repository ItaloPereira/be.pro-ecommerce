#!/bin/bash
CWD=`pwd`
SCRIPT=$(readlink -f $0)
SCRIPT_DIR=$(dirname "${SCRIPT}")

vmDatabase=$(cat "${SCRIPT_DIR}/../config.yml" | grep dbname: | head -n 1 | sed -e 's/.*dbname: \(.*\)/\1/')

echo "+ flush db script"
echo "DROP SCHEMA IF EXISTS \`${vmDatabase}\`;" > /tmp/flush-db.sql
echo "CREATE SCHEMA IF NOT EXISTS \`${vmDatabase}\` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;" >> /tmp/flush-db.sql

echo "+ load db"
if [ -f "${SCRIPT_DIR}/../database/migrations/dump_qa.sql" ]; then
  mysql -u root --database="${vmDatabase}" < ${SCRIPT_DIR}/../database/migrations/dump_qa.sql
fi
