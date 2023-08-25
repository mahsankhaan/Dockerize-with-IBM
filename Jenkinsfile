pipeline {
  agent any

  environment {
    GIT_CRED_ID = 'SVC-JENKINS-ADM'
    branchName = GIT_BRANCH

  }

  stages {
    stage('checkout') {
      steps {
        script {
          def git_params = checkout([$class: 'GitSCM'])
          //gitCommit = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
   



          println 'Getting current Branchss'
          if(branchName == 'jenkins')
{
                echo "I am from jenkins"


 }
          //println GIT_BRANCH


        }
      }
    }

  }
}
