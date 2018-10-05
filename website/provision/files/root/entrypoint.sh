#!/bin/sh

echo ">>> initializing <<<"

( cd /srv/provision && sleep 60; /usr/local/bin/db-migrate up --config database/database.json --migrations-dir database/migrations/ && echo "> finished migrating database") &

for i in templates server portal cms
do
  ( echo "> starting installation of $i";cd $i; yarn; echo "> finished installing $i") &
done

( echo "> starting installation of shared dependencies"; yarn && echo "> finished installation of shared dependencies") &

wait

for i in portal cms
do
  ( cd $i && echo "> watching $i" && yarn run dev ) &
done

/usr/sbin/nginx -g 'daemon off;' 2>/var/log/nginx-error 1>/var/log/nginx-log &
NGINXPID=$!

pm2-runtime ecosystem.json 2>/var/log/pm2-error 1>/var/log/pm2-log &
PM2PID=$!


echo ">>> Running! <<<"
echo "Nginx: $NGINXPID"
echo "PM2: $PM2PID"
tail -f /var/log/pm2-error /var/log/pm2-log /var/log/nginx-error /var/log/nginx-log 
