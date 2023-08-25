pipeline {
  agent any

  environment {
   def branchName = "${env.BRANCH_NAME}"
  }

  stages {
    stage('checkout') {
      steps {
        script {
         // def git_params = checkout([$class: 'GitSCM'])
          //gitCommit = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
   



          println 'Getting current Branchss'
        //  println GIT_BRANCH

          println branchName
          if(GIT_BRANCH == 'jenkins')
{
                echo "I am from jenkins"


 }
          //println GIT_BRANCH


        }
      }
    }

  }
}
