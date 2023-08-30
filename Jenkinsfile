pipeline {
 agent any


  environment {
   // DOCKERHUB_CREDENTIALS = credentials('dockerhub') for ahs** public access
   DOCKERHUB_CREDENTIALS = credentials('dockerorg')
   gitCredentials = credentials('GitHub')
   

  
}

    parameters {
        string(defaultValue: "", description: 'get branch name', name: 'branchname')
        string(defaultValue: "", description: 'get repo name', name: 'reponame')
        string(defaultValue: "", description: 'get gir url', name: 'gitrepo')
        string(defaultValue: "", description: 'get repo tag', name: 'repotag')

    }

    stages {
     
        stage('Get Branch name'){
            steps{
                echo "You choose branch: ${params.branchname}"
                echo "You choose repo : ${params.reponame}"
                echo "You choose git : ${params.gitrepo}"
                echo "You choose repo tag : ${params.repotag}"

             echo "I am set enviroment variable ${env.name}"

            }
        }
        stage('Clone the repo ') {

            steps{
            echo 'Make the output directory'
            // our build source will be available here
            sh 'mkdir -p build'


            dir('build') {
                // git branch: "${params.branchname}" , credentialsId: 'GitHub'	 , url: "${params.gitrepo}"
                //git branch: 'refs/tags/v9' , credentialsId: 'GitHub'	 , url: "${params.gitrepo}"


              // Clones the repository from the triggered release tag name
//              checkout([$class: 'GitSCM', branches: [[name: "refs/tags/${params.branchname}"]], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'SubmoduleOption', disableSubmodules: false, parentCredentials: false, recursiveSubmodules: false, reference: '', trackingSubmodules: false]], submoduleCfg: [], userRemoteConfigs: [[credentialsId: "GitHub", url: "https://github.com/LambdaX-AI/demo-repository.git"]]])
               checkout([$class: 'GitSCM', branches: [[name: "refs/tags/${params.branchname}"]], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'SubmoduleOption', disableSubmodules: false, parentCredentials: false, recursiveSubmodules: false, reference: '', trackingSubmodules: false]], submoduleCfg: [], userRemoteConfigs: [[credentialsId: "GitHub", url: "https://github.com/LambdaX-AI/ai-extractor.git"]]])

                //
              }     
          }  
          }

        stage('Move into the cloned directory'){
          steps
          {
            sh '''
                  cd /var/jenkins_home/jobs/sandboxserver/workspace/build
                  ls
                  cat /var/jenkins_home/jobs/sandboxserver/workspace/build/app.js
                '''

          }
        
    }
// check release and the perform deployment on the server
/*
       stage('Check Incoming release from which Branch') {
            steps {
                script {
                    if (params.branchname.contains('QA')) {
                        echo 'I only execute on the QA release'
                    } else if (params.branchname.contains('sandbox')) {
                        echo 'I only execute on the sandbox release'
                    }
                      else {
                         echo 'Known release'

                      }
                }
            }
        }
    
     */
      stage('Build Docker Image and Push to DockerHub'){
           steps {                       
              
             script {
               def dockerTool = tool name: 'docker', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
                   withEnv(["DOCKER=${dockerTool}/bin"]) {
                
                     sh  "cd /var/jenkins_home/jobs/sandboxserver/workspace/build && ${DOCKER}/docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW && ${DOCKER}/docker build -t  aboukrouh/${params.reponame}:${params.repotag} . && ${DOCKER}/docker push aboukrouh/${params.reponame}:${params.repotag}"
                   
               }
             }
           }
      }

    stage('login to sandbox server'){
      steps{ 

                script {
                    if (params.branchname.contains('qa')) {
                        echo 'I only execute on the QA release'
                           sshagent(credentials : ['login_sandbox_env'])  {    

                            echo 'I only execute on the QA release'

                            //command to remove the container
                            //(docker rm -f $(sudo docker ps -a | grep -E 'qa|QA|' | awk '{print $1}') || true)
                            //    docker images | grep 643975c526cf  | awk '{print $1 ":" $2}' | sort -u | xargs docker rmi -f

                            
                         //   sh "ssh -o StrictHostKeyChecking=no ec2-user@ec2-23-21-75-40.compute-1.amazonaws.com 'echo pwd && sudo -i -u root && docker -v && docker login  -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW  && docker pull aboukrouh/${params.reponame}:${params.repotag} && docker run --name ${params.branchname}-qa -d -v /data/appvol:/root/.paddleocr aboukrouh/${params.reponame}:${params.repotag}'"
                           }
                    }
                     
                    // else if (params.branchname.contains('sandbox')) {
                     else{
                        echo 'I only execute on the sandbox release'
                          sshagent(credentials : ['login_sandbox_env'])  {          
                           // sh "ssh -o StrictHostKeyChecking=no ec2-user@ec2-23-21-75-40.compute-1.amazonaws.com 'echo pwd && sudo -i -u root && docker -v && docker login  -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW && docker pull aboukrouh/${params.reponame}:${params.repotag} && (docker rm -f ${params.reponame}-sandbox || true) && docker run --name ${params.reponame}-${params.repotag} -d -p 5000:80 -v /data/appvol:/root/.paddleocr aboukrouh/${params.reponame}:${params.repotag}'"
                            sh "ssh -o StrictHostKeyChecking=no ec2-user@ec2-23-21-75-40.compute-1.amazonaws.com 'echo pwd && sudo -i -u root && docker -v && docker login  -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW && docker pull aboukrouh/${params.reponame}:${params.repotag} && docker run --name ${params.reponame}-${params.repotag} -d -v /data/appvol:/root/.paddleocr aboukrouh/${params.reponame}:${params.repotag}'"

                     }
                    }

                }
              
      }
       } 
}
}
