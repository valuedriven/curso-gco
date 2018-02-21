#!/bin/sh

echo 'Preparando containeres ...'
docker rm $(docker ps -q)	
docker-compose up -d

echo 'Criando banco de dados ...'
docker-compose exec db mysql -u root -psecret conchayorodb < banco/conchayorodb.sql

echo 'Criando estrutura de diretórios para projeto web...'
mkdir conchayoro/src/main/webapp/WEB-INF/classes
mkdir conchayoro/src/main/webapp/WEB-INF/classes/META-INF
mkdir conchayoro/src/main/webapp/WEB-INF/lib

echo "Compilando projeto..."
docker-compose run java javac -verbose -cp 'lib/*'  -d 'conchayoro/src/main/webapp/WEB-INF/classes'  conchayoro/src/main/java/br/com/conchayoro/entity/Produto.java conchayoro/src/main/java/br/com/conchayoro/persistence/ProdutoDao.java  conchayoro/src/main/java/br/com/conchayoro/service/ProdutoService.java

echo 'Copiando dependências...'
cp conchayoro/src/main/resources/META-INF/persistence.xml conchayoro/src/main/webapp/WEB-INF/classes/META-INF
cp lib/* conchayoro/src/main/webapp/WEB-INF/lib

echo "Gerando instalável..."
docker-compose run java jar cvf conchayoro.war -C conchayoro/src/main/webapp .

echo "Implantando instalável..."

#Utilizar interface gráfica do Tomcat

echo "Acessando aplicação..."

#curl http://localhost:8080/conchayoro

