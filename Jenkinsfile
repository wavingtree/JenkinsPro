pipeline{
    agent any
    environment {
        nd_nd = credentials ('dockerhub')
    }
    tools {
        maven 'Maven'
    }
    stages {
        stage("build jar") {
            steps {
                script {
                    echo "building the application"
                    sh 'mvn package'
                }
            }
        }
        stage("build image") {
            steps {
                script {
                    echo "building docker image"
                    
                    sh 'docker build -t treewaver007/demo-app:1.0 .'
                    sh "echo $nd_nd_PSW | docker login -u $nd_nd_USR --password-stdin"
                    sh 'docker push treewaver007/demo-app:1.0 '

                }
            }
        }
        stage ("deploy") {
            steps {
                script {
                    echo "deploying the application"
                }
            }
        }

    }
}
