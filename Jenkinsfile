pipeline {
  agent any

  environment {
    GIT_CRED_ID = 'SVC-JENKINS-ADM'

  }

  stages {
    stage('checkout') {
      steps {
        script {
          def git_params = checkout([$class: 'GitSCM'])
          gitCommit = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
          branchName = sh(
                  returnStdout: true,
                  script: "git branch -a --contains ${gitCommit} | grep -v PR- | sed 's/^.*\\///' | tail -1"
          ).trim()




          println 'Getting current Branchs'
           branchName
       //   println GIT_BRANCH


        }
      }
    }

  }
}
