#!/bin/sh

echo 'Preparando containeres ...'
docker-compose up -d

echo 'Executando ciclo clean, compile, package, install, deploy...'

echo 'Executando clean...'

docker-compose run --rm maven mvn clean --settings ambiente/maven/settings.xml
	
echo 'Executando compile...'

docker-compose run --rm maven mvn compile --settings ambiente/maven/settings.xml

echo 'Executando package...'

docker-compose run --rm maven mvn package --settings ambiente/maven/settings.xml

echo 'Executando install...'

docker-compose run --rm maven mvn install --settings ambiente/maven/settings.xml

echo 'Executando deploy Nexus...'

docker-compose run --rm maven mvn deploy --settings ambiente/maven/settings.xml

echo 'Executando deploy Tomcat...'

docker-compose run --rm maven mvn tomcat7:deploy --settings ambiente/maven/settings.xml
docker-compose run --rm maven mvn tomcat7:redeploy --settings ambiente/maven/settings.xml

echo 'Publicando no Sonar...'
docker-compose run --rm maven mvn sonar:sonar -Dsonar.host.url=http://sonar:9000 --settings ambiente/maven/settings.xml




