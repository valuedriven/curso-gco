
echo 'Criando estrutura de diretórios e arquivos ...'


SET data_dir=".data"

SET jenkins_dir=.data\jenkins

SET nexus_dir=.data\nexus

SET maven_dir=.data\maven


md .data\nexus\data

md .data\maven 

md .data\jenkins\data

md .data\jenkins\home



echo 'Complementando instalação Maven...'


cp ambiente\maven\settings.xml %maven_dir%\settings.xml


echo 'Realizando limpeza no docker...'


docker-compose up -d --build



echo 'Criando banco de dados ...'

docker-compose exec db mysql -u root -psecret conchayorodb < bancoscript\conchayorodb.sql

