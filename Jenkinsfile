pipeline {

    agent any 

    stages {

      stage("Commit") {

        steps {

          sh "echo '${COMPOSE_PROJECT_NAME}'"

          sh "ls -la"

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


