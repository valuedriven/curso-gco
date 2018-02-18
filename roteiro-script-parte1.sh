#!/bin/sh

#GUEST_IP=192.168.0.67

echo 'Copiando produtos...'

#git clone -b v0.0.1 http://github.com/valuedriven/conchayoro

echo 'Preparando containeres ...'

sudo rm -r data/

docker kill $(docker ps -q)

docker-compose up -d

echo 'Criando banco de dados ...'

docker-compose exec mysql-server mysql -u root -psecret conchayorodb < banco/conchayorodb.sql

#echo 'Copiando driver de banco de dados para Tomcat ...'

#sudo cp conchayoro/lib/mysql-connector-java-5.1.5.jar /opt/tomcat/lib

echo 'Criando estrutura de diretórios para projeto web...'

mkdir conchayoro/src/main/webapp/WEB-INF/classes
mkdir conchayoro/src/main/webapp/WEB-INF/classes/META-INF
mkdir conchayoro/src/main/webapp/WEB-INF/lib
cp conchayoro/src/main/resources/META-INF/persistence.xml conchayoro/src/main/webapp/WEB-INF/classes/META-INF
cp lib/* conchayoro/src/main/webapp/WEB-INF/lib

echo "Compilando projeto..."

docker run --rm -v "$PWD":/app -w /app java javac -verbose -cp 'lib/*'  -d 'conchayoro/src/main/webapp/WEB-INF/classes'  conchayoro/src/main/java/br/com/conchayoro/entity/Produto.java conchayoro/src/main/java/br/com/conchayoro/persistence/ProdutoDao.java  conchayoro/src/main/java/br/com/conchayoro/service/ProdutoService.java

echo "Gerando implantavel..."

docker run --rm -v "$PWD":/app -w /app java jar cvf data/webapps/conchayoro.war -C conchayoro/src/main/webapp .

echo "Reiniciando conteiner web..."

#systemctl restart tomcat.service

echo "Acessando aplicação..."

wget http://localhost:8080/conchayoro

