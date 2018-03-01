#!/bin/sh

data_dir=".data"
maven_dir=".m2"

echo 'Criando estrutura de diretórios e arquivos ...'
mkdir -p ${data_dir}/nexus/work
mkdir -p ${maven_dir}
mkdir -p conchayoroapp

#sudo chmod g+rwx -R ${data_dir}
#sudo chown -R 200:200 ${data_dir}/nexus

sudo chmod g+rwx -R ${maven_dir}
sudo chmod 777 -R ${maven_dir}

cp artefatos/pom.xml-configuracoes conchayoroapp/pom.xml
cp ambiente/maven/settings.xml-configuracoes ${maven_dir}/settings.xml

cp -r fonte/src/ conchayoroapp/

echo 'Realizando limpeza no docker...'
docker container prune -f
docker image prune -f
docker volume prune -f
docker network prune -f

#echo 'Removendo containers e imagens não usados...'
#docker rm $(docker ps -q)
#docker rm $(docker images -q)

echo 'Removendo todos containers e imagens...'
#docker rm $(docker ps -a -q) --force
#docker rmi $(docker images -a -q) --force

echo 'Preparando containeres ...'
docker-compose up -d --build

echo 'Criando banco de dados ...'
docker-compose exec db mysql -u root -psecret conchayorodb < bancoscript/conchayorodb.sql

#Criar repositórios no Nexus
