pipeline {
  agent any

  environment {
   def branchName = "${env.BRANCH_NAME}"
   USER_NAME = "Tester"
   // DOCKERHUB_CREDENTIALS = credentials('dockerhub') for ahs** public access
   DOCKERHUB_CREDENTIALS = credentials('dockerorg')

  
}


  stages {
    stage('login server'){
      steps{
      
        
           // sshagent(credentials : ['login_sandbox_server	']) {
              sshagent(credentials : ['login_sandbox_env'])  {
              login_sandbox_env
             sh 'ssh -o StrictHostKeyChecking=no ubuntu@ec2-18-204-4-100.compute-1.amazonaws.com "echo pwd && sudo -i -u root && docker -v && docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW"'
              
            //sh 'ssh -v user@hostname.com'
         //   sh 'scp ./source/filename user@hostname.com:/remotehost/target'
        }
             
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
