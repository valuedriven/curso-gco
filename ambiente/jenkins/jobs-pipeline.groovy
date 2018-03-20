pipelineJob('conchayoro-pipeline') {

  definition {

    cpsScm {

      scm {

        git {

          remote {

            credentials('conchayoro')

            url('http://github.com/valuedriven/curso-gco')

          }

        }

      }

      scriptPath('Jenkinsfile')

    }

  }

  scm {

    git {

      remote {

        credentials('conchayoro')

        url('http://github.com/valuedriven/curso-gco')

      }

    }

  }

  triggers {

      cron('@midnight')

  }

}
