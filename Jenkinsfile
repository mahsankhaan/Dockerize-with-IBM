pipeline {
  environment {
    registry = "gustavoapolinario/docker-test"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/mahsankhaan/build-scalable-application-using-ibmcloud-docker.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + "1"
        }
      }
    }


  }
}
