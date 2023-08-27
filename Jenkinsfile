pipeline {
  agent any

  environment {
   def branchName = "${env.BRANCH_NAME}"
   USER_NAME = "Tester"
   // DOCKERHUB_CREDENTIALS = credentials('dockerhub') for ahs** public access
   DOCKERHUB_CREDENTIALS = credentials('dockerorg')

  
}


  stages {
/*
      stage('Build Docker Image and Push to DockerHub'){
                    steps {
             script {
               def dockerTool = tool name: 'docker', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
               withEnv(["DOCKER=${dockerTool}/bin"]) {
                   //stages
                    sh '''
                       ${DOCKER}/docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW
                       ${DOCKER}/docker build -t aboukrouh/jenkins:v4 .
                       ${DOCKER}/docker push aboukrouh/jenkins:v4

                      '''
                      
               }
             }
           }
      }
*/


    stage('login server'){
      steps{
      
        
           // sshagent(credentials : ['login_sandbox_server	']) {
              sshagent(credentials : ['login_sandbox_env'])  {
           sh 'ssh -o StrictHostKeyChecking=no ec2-user@ec2-23-21-75-40.compute-1.amazonaws.com "echo pwd && sudo -i -u root && docker -v && docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW && docker pull aboukrouh/jenkins:v3 && (docker rm -f lambdax_pdf_extractor || true) && docker run --name lambdax_pdf_extractor -d -p 5000:80 -v /data/appvol:/root/.paddleocr aboukrouh/jenkins:v3"'

                
      //       sh 'ssh -o StrictHostKeyChecking=no ubuntu@ec2-18-204-4-100.compute-1.amazonaws.com "echo pwd && sudo -i -u root && docker -v && docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW"'
              
 
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
