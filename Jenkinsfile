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
          
          
          //set the branch
          def branch = GIT_BRANCH
          if(branch == 'origin/jenkins')
{
                echo "I am from jenkins"


 }
          //println GIT_BRANCH


        }
      }
    }

  }
}
