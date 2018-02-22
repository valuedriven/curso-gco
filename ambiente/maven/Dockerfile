FROM maven:alpine

ENV MAVEN_CONFIG=".m2"

COPY settings.xml-integracao-maven-nugget ${MAVEN_CONFIG}/settings.xml

ENTRYPOINT ["mvn"]


