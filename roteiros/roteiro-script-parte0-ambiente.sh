#!/bin/sh

#echo 'Realizando limpeza no docker...'
#docker container prune -f
#docker image prune -f
#docker volume prune -f
#docker network prune -f

echo 'Removendo todos containers e imagens...'
#docker rm $(docker ps -a -q) --force
#docker rmi $(docker images -a -q) --force

echo 'Preparando containeres ...'
docker-compose up -d --build

echo 'Criando banco de dados ...'
docker-compose exec db mysql -u root -psecret conchayorodb < bancoscript/conchayorodb.sql

