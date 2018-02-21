#!/bin/sh

echo 'Definindo variáveis de ambiente ...'

docker run -d -p 8081:8081 --name nexus sonatype/nexus3



