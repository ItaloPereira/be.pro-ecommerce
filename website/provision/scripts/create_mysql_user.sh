#!/bin/bash

mysql -uroot -proot -e "CREATE USER 'embraer'@'localhost' IDENTIFIED BY 'ZTBlYmJkNGU5N2U3Y2Y0Mwo';"
mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON embraer.* TO 'embraer'@'localhost' WITH GRANT OPTION;"

