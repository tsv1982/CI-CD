pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage('build'){
            steps {  
                sh "mvn clean package" 
            }
        stage('sonar'){
            steps{
                sh '''mvn sonar:sonar \\
                       -Dsonar.projectKey=test \\
                       -Dsonar.host.url=http://192.168.1.16:9000 \\'''
            }
        }
        }    
    }
}