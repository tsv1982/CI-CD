pipeline {
    agent any

  environment {
      DOCKER_VERSION_TAG = getVersion()
    }
    
    stages{ 
      
        stage('Git') {
            steps {
             git credentialsId: 'git_key', url: 'https://github.com/tsv1982/CI-CD.git'
           }
        }
        
        stage('sonar'){
            steps {
            withCredentials([string(credentialsId: 'sonar_token', variable: 'sonar-pwd')]) {
                   sh '''mvn sonar:sonar \\
                         -Dsonar.projectKey=tomcat_test1 \\
                         -Dsonar.host.url=http://192.168.1.18:9000 \\
                         -Dsonar.login=25dbeed397414b1c25577b669410fddc1dbcf32e'''
//-Dsonar.login=${sonar-pwd}'''
               }
            }
        }
        
        stage('build'){
            steps {  
                sh "mvn clean package" 
            }
        }
        
        stage('docker build'){
            steps {
                sh 'docker-compose build'
            }
        }
        
        stage('Docker push'){
            steps {
                 echo "${DOCKER_VERSION_TAG}"
                 withCredentials([string(credentialsId: 'docker_pas', variable: 'dockerHab_pas')]) {
                     sh "docker login -u tsv1982 -p ${dockerHab_pas}"
                 }
                 sh 'docker tag tomcat:latest tsv1982/tomcat:${DOCKER_VERSION_TAG}'
                 sh 'docker push tsv1982/tomcat:${DOCKER_VERSION_TAG}'
                  
            }
        }
    } 

}

def getVersion(){
    def commitHash = sh label: '', returnStdout: true, script: 'git rev-parse --short HEAD'
    return commitHash
}