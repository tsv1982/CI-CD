pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
    def mvnHome = tool name: 'maven', type: 'maven'  
        stage('build'){
            steps {  
                sh "${mvnHome}/bin/mvn clean package" 
            }
        }    
    }
}