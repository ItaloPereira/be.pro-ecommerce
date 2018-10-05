#!/bin/bash
CWD=`pwd`
SCRIPT=$(readlink -f $0)
SCRIPT_DIR=$(dirname "${SCRIPT}")

bash "${SCRIPT_DIR}/database.sh"
db-migrate up --migrations-dir "${SCRIPT_DIR}/../database/migrations" --config "${SCRIPT_DIR}/../database/database.json"
echo "Database reset done successfully"
