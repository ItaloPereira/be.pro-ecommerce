#!/bin/bash

for i in $@
do
  s3cmd sync $i s3://embraer-develop
  FILENAME=$(echo $i | rev |cut -d '/' -f1 | rev)
  s3cmd setacl s3://embraer-develop/$FILENAME --acl-public
  echo "This asset is available at: https://embraer-develop.nyc3.digitaloceanspaces.com/$FILENAME"
done
