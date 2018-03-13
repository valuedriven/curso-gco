#!/bin/sh

echo 'Preparando containeres ...'
docker-compose up -d

echo 'Executando ciclo clean, compile, package, install, deploy...'

echo 'Executando clean...'

docker-compose run --rm maven mvn clean
	
echo 'Executando compile...'

docker-compose run --rm maven mvn compile

echo 'Executando package...'

docker-compose run --rm maven mvn package

echo 'Executando install...'

docker-compose run --rm maven mvn install

echo 'Executando deploy Nexus...'

docker-compose run --rm maven mvn deploy

echo 'Executando deploy Tomcat...'

docker-compose run --rm maven mvn tomcat7:deploy
docker-compose run --rm maven mvn tomcat7:redeploy

echo 'Publicando no Sonar...'
docker-compose run --rm maven mvn sonar:sonar -Dsonar.host.url=http://sonar:9000




