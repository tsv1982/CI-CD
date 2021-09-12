node {
   stage('git'){
       git credentialsId: '502a475a-5798-4617-9367-1f84208c9ce0', url: 'git@github.com:tsv1982/CI-CD.git'
   } 
   def mvnHome = tool name: 'maven', type: 'maven'  
   stage('build'){
       sh "${mvnHome}/bin/mvn clean package" 
   }
   stage('copy_file'){
      sh 'scp -r target tsv@192.168.1.131:/home/tsv/CI-CD/'
      sh 'scp -r docker tsv@192.168.1.131:/home/tsv/CI-CD/'
      sh 'scp -r mysql-dump tsv@192.168.1.131:/home/tsv/CI-CD/'
      sh 'scp -r first.yml tsv@192.168.1.131:/home/tsv/CI-CD/'
      sh 'scp -r p_docker_restart.yml tsv@192.168.1.131:/home/tsv/CI-CD/'
   }
   stage('start_playbook'){
      sh 'ssh tsv@192.168.1.131 \'ansible-playbook /home/tsv/CI-CD/first.yml\' '
   }
    stage('start_job_git'){
      build job: 'job_ansible_webhook'
   }
}
