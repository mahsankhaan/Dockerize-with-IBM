pipeline {
  agent any

  environment {
   def branchName = "${env.BRANCH_NAME}"
   USER_NAME = "Tester"
}


  stages {
    stage('login server'){
      steps{
            sshagent(credentials:['18.204.4.100']){
            sh 'ssh  -o StrictHostKeyChecking=no  ubuntu@18.204.4.100 "whoami"'
          }
           echo "success lgoin"
         }
       }
    stage('checkout') {
      steps {
        script {
         // def git_params = checkout([$class: 'GitSCM'])
          //gitCommit = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
   



          println 'Getting current Branchss'        
          //println GIT_BRANCH

          
          //set the branch
          def branch = GIT_BRANCH
          if(branch == 'origin/jenkins')
{
                echo "I am from jenkins"
               echo "Current user is ${env.USER_NAME}"

 }


        }
      }
    }

  }
}
