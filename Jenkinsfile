pipeline {
   agent any
   stages {
stage('Install dependencies') {
  steps {
    script {
      def dockerTool = tool name: 'docker', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
      withEnv(["DOCKER=${dockerTool}/bin"]) {
          //stages
           //sh "${DOCKER}/docker version"
             sh "docker"
      }
    }
  }
}
   }
}
