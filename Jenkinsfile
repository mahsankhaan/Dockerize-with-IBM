pipeline {
  agent any

  environment {
    GIT_CRED_ID = 'SVC-JENKINS-ADM'

    GIT_REPO = 'https://github.com/mahsankhaan/build-scalable-application-using-ibmcloud-docker.git'
  }

  stages {
    stage('checkout') {
      steps {
        script {
          def git_params = checkout([$class: 'GitSCM'])

          println(git_params)

          println 'Getting current Branchs'
          sh "echo 'branchName: ${branchName}'" 


          println GIT_BRANCH
        }
      }
    }

  }
}
