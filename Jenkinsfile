pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages {
        stage('Front-end') {
            steps {
                sh '''
                   docker version
              '''
            }
        }
    }
  }
