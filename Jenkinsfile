pipeline {

    agent any 

    tools {

      maven 'Maven-3.5.3'

    }

    stages {


      stage("Commit") {

        steps {

          sh "mvn clean --settings ambiente/maven/settings.xml"
          sh "mvn compile --settings ambiente/maven/settings.xml"
          sh "mvn package --settings ambiente/maven/settings.xml"
          sh "mvn install --settings ambiente/maven/settings.xml"
          sh "mvn deploy --settings ambiente/maven/settings.xml"

        }

      }

      stage("Aceitação") { 

        steps {

          sh "mvn tomcat7:redeploy --settings ambiente/maven/settings.xml"

        }

      }

      stage("Entrega") { 

        steps {

          sh "echo 'Estágio de entrega'"

        }

      }

   }

}


