docker volume create volume-bepro
docker run -p 3306:3306 --name bepro.vm-mysql -e MYSQL_ROOT_PASSWORD=root -v volume-bepro -d mysql