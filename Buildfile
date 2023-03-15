 pipeline {
   agent{
     label 'app-node'
   } 
   
   stages {
     stage('Git Checkout') {
       steps {
         checkout scm
       }
     }
     
     stage('Deploying App host'){
       environment{
         BUILD_NUMBER = "$env.BUILD_NUMBER"
       }
       steps {
         sh 'sudo docker stop apphost || true && sudo docker rm apphost || true'
         sh 'sudo docker run -itd --name apphost -p 8080:8081 357734901335.dkr.ecr.ap-northeast-1.amazonaws.com/app:${BUILD_NUMBER}'
       }
     }
   }
 }
