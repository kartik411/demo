pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
    
        stage ("terraform init") {
            steps {
                sh ("terraform init") 
            }
        }

       stage ("terraform Action") {
            steps {
              //  echo "Terraform action is --> ${action}"
                sh ('terraform apply --auto-approve') 
           }
        }
    }
    agent{
     label 'app-host'
   } 
  
   stages {
     stage('Git Checkout') {
       steps {
         checkout scm
       }
     }
     
     stage('Build Docker Image') {
       steps {
         sh 'cd test-nodeapp-1-task && sudo docker build -t app .'
         sh 'aws ecr get-login-password --region ap-northeast-1 | sudo docker login --username AWS --password-stdin 357734901335.dkr.ecr.ap-northeast-1.amazonaws.com'
         sh 'sudo docker tag app:latest 357734901335.dkr.ecr.ap-northeast-1.amazonaws.com/app:${BUILD_NUMBER}'
         sh 'sudo docker push 357734901335.dkr.ecr.ap-northeast-1.amazonaws.com/app:${BUILD_NUMBER}'
       }
     }
    
     stage('Deploying App host') {
       steps {
         // sh 'sudo docker ps '
         // sh 'sudo docker stop apphost'
         // sh 'sudo docker rm apphost'
         sh 'sudo docker run -itd --name apphost -p 8080:8081 357734901335.dkr.ecr.ap-northeast-1.amazonaws.com/app:${BUILD_NUMBER}'
       }
     }
   }
}
