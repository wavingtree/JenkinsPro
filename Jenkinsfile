def gv

pipeline {
    agent any
    tools {
        maven 'Maven'
    }
    parameters{
// string(name: 'VERSION', defaultValue: '', description: 'version to deploy on prod')
        choice(name: 'VERSION', choices: ['1.1.0', '1.2.0', '1.3.0'], description: '')
        booleanParam(name: 'executeTests', defaultValue: true , description: '')
    }
    
   stages {
        stage('init') {
            steps {
                script {
                    gv = load "script.groovy"
                }     
            }
        }
        stage('build') {
            steps {
                script {
                    gv.buildApp()
                }
            }
        }
        
        stage('test') {
            when {
                expression {
                    params.executeTests
                }
            }
          
            steps {
                script {
                    gv.testApp()
                }
            }
        }
            
        
        stage('deploy') {
            input {
                message "Select environment to deploy to"
                ok "Perfect"
                parameters {
                  choice(name: 'ONE', choices: ['dev', 'staging', 'prod'], description: '')
                  choice(name: 'TWO', choices: ['dev', 'staging', 'prod'], description: '')
                }
            }
            steps {
                script {
                    gv.deployApp()
                    echo "Deploying to ${ONE}"
                    echo "Deploying to ${TWO}"
                }
                
            }
        }
        
   }
   
}
