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
}
