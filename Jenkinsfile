pipeline {

    agent any 

    stages {


      stage("Commit") {

        steps {

          sh "mvn clean --settings ambiente/maven/settings.xml"
          sh "mvn compile --settings ambiente/maven/settings.xml"
          sh "mvn package --settings ambiente/maven/settings.xml"

        }

      }

      stage("Aceitação") { 
        steps {
          sh "echo 'estagio Acceptance'"
        }
      }
      stage("Entrega") { 
        steps {
          sh "echo 'deliver stage'"
        }
      }
   }
   post {
        always {
            sh "docker-compose down -v"
        }
    }
}


