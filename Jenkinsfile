pipeline {

    agent any 

    environment {

        COMPOSE_PROJECT_NAME = "docker-compose.yml"

    }

    stages {

      stage("Commit") {

        steps {

          sh "echo '${COMPOSE_PROJECT_NAME}'"

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


