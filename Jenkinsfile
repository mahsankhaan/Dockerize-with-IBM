pipeline {
  agent any

  environment {
    GIT_CRED_ID = 'SVC-JENKINS-ADM'

  }

  stages {
    stage('checkout') {
      steps {
        script {
          def git_params = checkout([$class: 'GitSCM'])
          //gitCommit = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
   

          def branchName = "${env.BRANCH_NAME}"


          println 'Getting current Branchs'
          println branchName
       //   println GIT_BRANCH


        }
      }
    }

  }
}
