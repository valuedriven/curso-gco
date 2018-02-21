#!/bin/sh

echo 'Preparando containeres ...'
docker rm $(docker ps -q)	
docker-compose up -d

echo 'Criando banco de dados ...'
docker-compose exec db mysql -u root -psecret conchayorodb < bancoscript/conchayorodb.sql
