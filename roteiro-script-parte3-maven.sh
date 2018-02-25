#!/bin/sh

docker-compose run maven mvn clean -f conchayoroapp/pom.xml 
	
docker-compose run maven mvn compile -f conchayoroapp/pom.xml

docker-compose run maven mvn test -f conchayoroapp/pom.xml

docker-compose run maven mvn site -f conchayoroapp/pom.xml

docker-compose run maven mvn package -f conchayoroapp/pom.xml

docker-compose run maven mvn install -f conchayoroapp/pom.xml

docker-compose run maven mvn deploy -f conchayoroapp/pom.xml

docker-compose run maven mvn tomcat7:deploy -f conchayoroapp/pom.xml

docker-compose run maven mvn tomcat7:redeploy -f conchayoroapp/pom.xml





