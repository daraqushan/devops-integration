pipeline{
    agent any
    tools{
        maven 'Maven Local'
    }
    stages{
        stage('build maven'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/daraqushan/devops-integration']])
                bat 'mvn clean install'
                
            }
        }
        stage('build docker image'){
            steps{
                script{
                    bat 'docker build -t cgg2024/devops-integration .'
                }
            }
        }
        stage("push to docker hub"){
            steps{
                script{
                  withCredentials([string(credentialsId: 'docker-hub-pwd', variable: 'dockerhubpwd')]) {
                     
                    bat 'docker login -u cgg2024 -p %dockerhubpwd%'
                    bat 'docker push cgg2024/devops-integration'
}
            }
        }
    }
}
}