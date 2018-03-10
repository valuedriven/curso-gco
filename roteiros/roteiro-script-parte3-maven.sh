#!/bin/sh

echo 'Preparando containeres ...'
docker-compose up -d

echo 'Executando ciclo clean, compile, test, site, package, install, deploy...'

docker-compose run --rm maven mvn clean
	
docker-compose run --rm maven mvn compile

docker-compose run --rm maven mvn test

docker-compose run --rm maven mvn site

docker-compose run --rm maven mvn package

docker-compose run --rm maven mvn install

docker-compose run --rm maven mvn deploy

docker-compose run --rm maven mvn tomcat7:deploy

docker-compose run --rm maven mvn tomcat7:redeploy





