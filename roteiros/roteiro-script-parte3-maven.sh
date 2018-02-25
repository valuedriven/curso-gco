#!/bin/sh

maven_project="conchayoroapp/pom.xml"

docker-compose run maven mvn clean -f ${maven_project}
	
docker-compose run maven mvn compile -f ${maven_project}

docker-compose run maven mvn test -f ${maven_project}

docker-compose run maven mvn site -f ${maven_project}

docker-compose run maven mvn package -f ${maven_project}

docker-compose run maven mvn install -f ${maven_project}

docker-compose run maven mvn deploy -f ${maven_project}

docker-compose run maven mvn tomcat7:deploy -f ${maven_project}

docker-compose run maven mvn tomcat7:redeploy -f ${maven_project}





