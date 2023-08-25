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


stage('Deployment on sandbox') {
 when {
                branch 'sandbox'
            }

  steps {
    script {
      def dockerTool = tool name: 'docker', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
      withEnv(["DOCKER=${dockerTool}/bin"]) {


          //HERRE CONNECT WITH THE SERVER
           sh '''

             I am from sandbox


             '''
             
      }
    }
  }
}
stage('Deployment on Development') {
 when {
                branch 'jenkins'
            }

  steps {
    script {
      def dockerTool = tool name: 'docker', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
      withEnv(["DOCKER=${dockerTool}/bin"]) {


          //HERRE CONNECT WITH THE SERVER
           sh '''

             I am from Development branch


             '''
             
      }
    }
  }
}
      
   }
}
