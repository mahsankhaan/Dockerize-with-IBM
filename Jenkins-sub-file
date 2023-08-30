pipeline {
    agent any


    stages {
        stage('Start'){
            steps{
                script{
                def branchname = GIT_BRANCH
                //def tag = sh "returnStdout: true, script: "git tag --sort version:refname | tail -1").trim()"
                def repotag = sh(returnStdout: true, script: "git tag --contains | head -1").trim()

                def gitrepo = scm.getUserRemoteConfigs()[0].getUrl()
                def reponame= scm.getUserRemoteConfigs()[0].getUrl().tokenize('/').last().split("\\.")[0]

                 //echo "ref name is ${reponame}" 
                 echo "ref name is ${repotag}" 

               build job: 'sandboxserver', wait: false, parameters: [string(name: 'branchname', value: branchname ),string(name: 'reponame', value: reponame ), string(name: 'gitrepo', value: gitrepo ), string(name: 'repotag', value: repotag )] 
                

                }
            }
        }
    }
}
