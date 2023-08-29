pipeline {
    agent any


    stages {
        stage('Start'){
            steps{
                script{
                def branchname = GIT_BRANCH
                def gitrepo = scm.getUserRemoteConfigs()[0].getUrl()
                def reponame= scm.getUserRemoteConfigs()[0].getUrl().tokenize('/').last().split("\\.")[0]


                build job: 'sandboxserver', wait: false, parameters: [string(name: 'branchname', value: branchname ),string(name: 'reponame', value: reponame ), string(name: 'gitrepo', value: gitrepo )] 
                

                }
            }
        }
    }
}
