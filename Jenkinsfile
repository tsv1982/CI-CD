node {
   stage('git'){
       git credentialsId: '7a6f8112-7864-4ba9-bafb-cf379e82be2d', url: 'git@github.com:tsv1982/CI-CD.git'
   } 
   def mvnHome = tool name: 'maven', type: 'maven'  
   stage('build'){
       sh "${mvnHome}/bin/mvn clean package" 
   }
   stage('copy_file'){
      sh 'scp -r target tsv3@192.168.0.151:/home/tsv/CI-CD/'
      sh 'scp -r docker tsv3@192.168.0.151:/home/tsv/CI-CD/'
      sh 'scp -r mysql-dump tsv3@192.168.0.151:/home/tsv/CI-CD/'
      sh 'scp -r first.yml tsv3@192.168.0.151:/home/tsv/CI-CD/'
      sh 'scp -r p_docker_restart.yml tsv3@192.168.0.151:/home/tsv/CI-CD/'
   }
   stage('start_playbook'){
      sh 'ssh tsv3@192.168.0.151 \'ansible-playbook /home/tsv/CI-CD/first.yml\' '
   }
//    stage('start_job_git'){
//      build job: 'job_ansible_webhook'
//   }
}
