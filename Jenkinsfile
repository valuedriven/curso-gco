pipeline {
    agent any 

    stages {
      stage('Commit') {
        steps {
          sh 'echo "commit stage"'
        }
      }
      stage('Acceptance') { 
        steps {
          sh 'echo "acceptance stage"'
        }
        post {
          always {
            junit 'target/surefire-reports/*.xml' 
          }
        }
      }
      stage('Deliver') { 
        steps {
          sh 'echo "deliver stage"'
        }
      }
   }
}
