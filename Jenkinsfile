pipeline {
  agent any

  environment {
   def branchName = "${env.BRANCH_NAME}"
   USER_NAME = "Tester"
}


  stages {
    stage('login server'){
      steps{
            
             //sh 'ssh  -o StrictHostKeyChecking=no ubuntu@ec2-18-204-4-100.compute-1.amazonaws.com "whoami"'
             sh 'sudo ssh -i  /root/.ssh/"sandbox-env.pem"  ubuntu@ec2-18-204-4-100.compute-1.amazonaws.com'
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
