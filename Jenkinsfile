pipeline {

    agent any 

    environment {
    
        COMPOSE_FILE = "docker-compose.yml"

    }

    stages {


      stage("Commit") {

        steps {

          sh "ls -la"
          sh "docker-composer up -d --build"

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


