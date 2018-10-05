#!/bin/bash
CWD=`pwd`
SCRIPT=$(readlink -f $0)
SCRIPT_DIR=$(dirname "${SCRIPT}")

vmDatabase=$(cat "${SCRIPT_DIR}/config.yml" | grep dbname: | head -n 1 | sed -e 's/.*dbname: \(.*\)/\1/')

echo "+ flush db script"
echo "DROP SCHEMA IF EXISTS \`${vmDatabase}\`;" > /tmp/flush-db.sql
echo "CREATE SCHEMA IF NOT EXISTS \`${vmDatabase}\` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;" >> /tmp/flush-db.sql

echo "+ flushing"
mysql -u root < /tmp/flush-db.sql
rm -f /tmp/flush-db.sql

echo "+ load db"
if [ -f "${SCRIPT_DIR}/database/structure.sql" ]; then
  mysql -u root --database="${vmDatabase}" < ${SCRIPT_DIR}/database/structure.sql
fi

if [ -f "${SCRIPT_DIR}/database/migrations.sql" ]; then
  echo "+ load migrations"
  mysql -u root --database="${vmDatabase}" < ${SCRIPT_DIR}/database/migrations.sql
fi

if [ -f "${SCRIPT_DIR}/database/dump1708181633.sql" ]; then
  echo "+ load dump1708181633"
  mysql -u root --database="${vmDatabase}" < ${SCRIPT_DIR}/database/dump1708181633.sql
fi

echo "+ flush db script"
echo "DROP SCHEMA IF EXISTS test;" > /tmp/flush-db.sql
echo "CREATE SCHEMA IF NOT EXISTS test DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;" >> /tmp/flush-db.sql

echo "+ flushing"
mysql -u root < /tmp/flush-db.sql
rm -f /tmp/flush-db.sql

echo "+ load db"
if [ -f "${SCRIPT_DIR}/database/structure.sql" ]; then
  mysql -u root --database=test < ${SCRIPT_DIR}/database/structure-test.sql
fi

if [ -f "${SCRIPT_DIR}/database/dump1708181633.sql" ]; then
  echo "+ load dump1708181633"
  mysql -u root --database=test < ${SCRIPT_DIR}/database/fixtures-test.sql
fi
