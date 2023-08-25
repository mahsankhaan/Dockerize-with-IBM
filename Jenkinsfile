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
          //   sh 'ssh -i  /root/.ssh/"sandbox-env.pem"  ubuntu@ec2-18-204-4-100.compute-1.amazonaws.com'
             //  ssh -i  /home/ubuntu/.ssh/"sanbox-env.pem" 'ubuntu@ec2-18-204-4-100.compute-1.amazonaws.com'
            sshagent(credentials : ['login_sandbox_server	']) {
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@ec2-18-204-4-100.compute-1.amazonaws.com 'echo "helloworld" '
               // 'ssh  -o "StrictHostKeyChecking no" -i ~/.ssh/id_rsa ${{ env.EC2_USER }}@${{ env.EC2_HOSTNAME }} 'echo ${{ secrets.DOCKER_PASSWORD }} ''

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
