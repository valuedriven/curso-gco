#!/bin/sh

echo 'Preparando containeres ...'

docker kill $(docker ps -q)

docker-compose up -d

echo 'Criando banco de dados ...'

docker-compose exec db mysql -u root -psecret conchayorodb < banco/conchayorodb.sql

echo 'Criando estrutura de diretórios para projeto web...'

mkdir conchayoro/src/main/webapp/WEB-INF/classes
mkdir conchayoro/src/main/webapp/WEB-INF/classes/META-INF
mkdir conchayoro/src/main/webapp/WEB-INF/lib
cp conchayoro/src/main/resources/META-INF/persistence.xml conchayoro/src/main/webapp/WEB-INF/classes/META-INF
cp lib/* conchayoro/src/main/webapp/WEB-INF/lib

echo "Compilando projeto..."

docker run --rm -v "$PWD":/app -w /app java javac -verbose -cp 'lib/*'  -d 'conchayoro/src/main/webapp/WEB-INF/classes'  conchayoro/src/main/java/br/com/conchayoro/entity/Produto.java conchayoro/src/main/java/br/com/conchayoro/persistence/ProdutoDao.java  conchayoro/src/main/java/br/com/conchayoro/service/ProdutoService.java

echo "Gerando implantavel..."

docker run --rm -v "$PWD":/app -w /app java jar cvf conchayoro.war -C conchayoro/src/main/webapp .

echo "Reiniciando conteiner web..."

#systemctl restart tomcat.service

echo "Acessando aplicação..."

#wget http://localhost:8080/conchayoro

