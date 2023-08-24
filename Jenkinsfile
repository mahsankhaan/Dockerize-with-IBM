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
            agent {
                docker { image 'node:18.17.1-alpine3.18' }
            }
            steps {
                sh 'node --version'
            }
        }
    }
}
  }

}
