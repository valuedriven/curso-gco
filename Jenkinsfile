pipeline {

    agent any 

    stages {

      stage('Commit') {

        steps {

          sh 'echo ${COMPOSE_PROJECT_NAME}"

        }

      }

      stage('Acceptance') { 
        steps {
          sh 'echo "acceptance stage"'
        }
      }
      stage('Deliver') { 
        steps {
          sh 'echo "deliver stage"'
        }
      }
   }
   post {
        always {
            sh "docker-compose down -v"
        }
    }
}


