FROM maven:alpine

ENV MAVEN_CONFIG="/app/m2"

COPY settings.xml-integracao-maven-nexus ${MAVEN_CONFIG}/settings.xml

ENTRYPOINT ["mvn"]


