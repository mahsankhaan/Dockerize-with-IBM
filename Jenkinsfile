pipeline {
   agent any
   stages {
stage('Install dependencies') {
  steps {
    script {
      def dockerTool = tool name: 'docker', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
      withEnv(["DOCKER=${dockerTool}/bin"]) {
          //stages
           sh '''

             ${DOCKER}/docker version


             '''
             
      }
    }
  }
}


stage('Deployment on server') {
  steps {
    script {
      def dockerTool = tool name: 'docker', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
      withEnv(["DOCKER=${dockerTool}/bin"]) {


          //HERRE CONNECT WITH THE SERVER
           sh '''

             ${DOCKER}/docker version


             '''
             
      }
    }
  }
}

      
   }
}
