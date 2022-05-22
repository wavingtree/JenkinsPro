pipeline{
    agent any
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
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'PASS', usernameVariable: 'USER')])
                        sh 'docker build -t treewaver007/demo-app:1.0 .'
                        sh "echo $PASS | docker login -u $USER --password-stdin"
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
