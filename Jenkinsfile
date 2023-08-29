pipeline {
    agent any


    stages {
        stage('Start'){
            steps{
                script{
                def branchname = GIT_BRANCH
                def tagname   = TAG_NAME
                def gitrepo = scm.getUserRemoteConfigs()[0].getUrl()
                def reponame= scm.getUserRemoteConfigs()[0].getUrl().tokenize('/').last().split("\\.")[0]

                // echo "ref name is ${reponame}" 
                echo "ref name is ${tagname}" 

           //     build job: 'sandboxserver', wait: false, parameters: [string(name: 'branchname', value: branchname ),string(name: 'reponame', value: reponame ), string(name: 'gitrepo', value: gitrepo )] 
                

                }
            }
        }
    }
}
