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
             ${DOCKER}/docker login -u ahsanoffical -p ahsan.123
             ${DOCKER}/docker build -t docker build -t ahsanoffical/avengers:v3 .

             '''
             
      }
    }
  }
}
   }
}
