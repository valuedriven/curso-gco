#!/bin/sh

data_dir=".data"
maven_dir=".m2"
jenkins_dir=".jenkins"
nexus_dir=${data_dir}/nexus

echo 'Criando estrutura de diretórios e arquivos ...'
mkdir -p ${nexus_dir}
mkdir -p ${maven_dir}
mkdir -p ${jenkins_dir}/data
mkdir -p ${jenkins_dir}/home
sudo chown -R 200:200 ${nexus_dir}

echo 'Configurações para projeto maven...'
sudo chmod g+rwx -R ${maven_dir}
sudo chmod 777 -R ${maven_dir}
#mkdir -p conchayoroapp
#cp -r fonte/src/ conchayoroapp/
cp artefatos/pom.xml-configuracoes pom.xml
cp ambiente/maven/settings.xml-configuracoes ${maven_dir}/settings.xml

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
