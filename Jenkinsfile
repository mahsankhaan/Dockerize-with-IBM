pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages {
        stage("docker build & docker push"){
            steps{
                script{
                   
                             sh '''
                                docker login -u ahsanoffical -p ahsan.123

                                docker build -t 34.125.214.226:8083/springapp:v1 .

                            '''
                    
                }
            }
        }
  }

}
