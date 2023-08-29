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
             //  checkout([$class: 'GitSCM', branches: [[name: "refs/tags/${params.repotag}]], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'SubmoduleOption', disableSubmodules: false, parentCredentials: false, recursiveSubmodules: false, reference: '', trackingSubmodules: false]], submoduleCfg: [], userRemoteConfigs: [[credentialsId: "GitHub", url: "https://github.com/LambdaX-AI/demo-repository.git"]]])
               checkout([$class: 'GitSCM', branches: [[name: "refs/tags/${params.repotag}"]], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'SubmoduleOption', disableSubmodules: false, parentCredentials: false, recursiveSubmodules: false, reference: '', trackingSubmodules: false]], submoduleCfg: [], userRemoteConfigs: [[credentialsId: "GitHub", url: "https://github.com/LambdaX-AI/demo-repository.git"]]])

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
                '''

          }
        
    }
/*                                                       
        stage('Delete cloned directory'){
          steps
          {
            sh '''
                  rm -rf /var/jenkins_home/jobs/sandboxserver/workspace/build
                  ls
                '''

          }
        
    }
     
  
/*
      stage('Build Docker Image and Push to DockerHub'){
           steps {                       
                     // sh "echo branchname is ${params.branchname}"

             script {
               def dockerTool = tool name: 'docker', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
               withEnv(["DOCKER=${dockerTool}/bin"]) {
                
                   

                    // move into the directory where dockerfile is available and build the docker image and push
                    sh  "cd /var/jenkins_home/jobs/sandboxserver/workspace/build && ${DOCKER}/docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW && ${DOCKER}/docker build -t aboukrouh/jenkins:${params.branchname} . && ${DOCKER}/docker push aboukrouh/jenkins:${params.branchname} "
                    
                                             
                
                      
               }
             }
           }
      }

 /*    
    stage('login to sandbox server'){
      steps{ 
           // sshagent(credentials : ['login_sandbox_server	']) {
             sshagent(credentials : ['login_sandbox_env'])  {
                sh 'ssh -o StrictHostKeyChecking=no ec2-user@ec2-23-21-75-40.compute-1.amazonaws.com "echo pwd && sudo -i -u root && docker -v && docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW && docker pull aboukrouh/jenkins:v5 && (docker rm -f lambdax_pdf_extractor || true) && docker run --name lambdax_pdf_extractor -d -p 5000:80 -v /data/appvol:/root/.paddleocr aboukrouh/jenkins:v5"'

                
      //       sh 'ssh -o StrictHostKeyChecking=no ubuntu@ec2-18-204-4-100.compute-1.amazonaws.com "echo pwd && sudo -i -u root && docker -v && docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW"'
              
 
        }
             
      }
       } */
}
}
