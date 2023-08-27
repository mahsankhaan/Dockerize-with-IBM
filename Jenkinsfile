pipeline {
  agent any

  environment {
    GIT_CRED_ID = 'SVC-JENKINS-'

  }

  stages {
    stage('checkout') {
      steps {
        script {
          def git_params = checkout([$class: 'GitSCM'])

          println 'Getting current Branchs'

          println GIT_BRANCH


        }
      }
    }

  }
}
