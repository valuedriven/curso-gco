#!/bin/sh

echo 'Criando estrutura de diretórios e arquivos ...'
mkdir -p data/nexus/work
mkdir -p conchayoroapp
mkdir -p .m2

sudo chmod g+rwx -R data
sudo chmod g+rwx -R .m2
sudo chmod 777 -R .m2
sudo chown -R 200:200 data/nexus

cp artefatos/settings.xml-integracao-maven-nexus .m2/settings.xml
cp artefatos/pom.xml-dependencias-integracao-nexus conchayoroapp/pom.xml
cp -r fonte/src/ conchayoroapp/

echo 'Realizando limpeza leve no docker...'
docker container prune -f
docker image prune -f
docker volume prune -f
docker network prune -f

#echo 'Removendo containers e imagens não usados...'
#docker rm $(docker ps -q)
#docker rm $(docker images -q)

#echo 'Removendo todos containers e imagens...'
#docker rm $(docker ps -a -q) --force
#docker rmi $(docker images -a -q) --force

echo 'Preparando containeres ...'
docker-compose up -d --build

echo 'Criando banco de dados ...'
docker-compose exec db mysql -u root -psecret conchayorodb < bancoscript/conchayorodb.sql



