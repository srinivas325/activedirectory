pipeline {
    agent any
    environment {
        HOST_NAME = 'ServerCore'
        CREDENTIALS_ID = 'win-ad-vm'
    }
    stages {
        stage('Setup WinRM Client') {
            steps {
                script {
                    // Initialize winRMOperations
                    def winRMOperations = [] // Replace with actual operations if needed

                    // Call winRMClient with named parameters
                    winRMClient hostName: "${env.HOST_NAME}", 
                                credentialsId: "${env.CREDENTIALS_ID}", 
                                winRMOperations: winRMOperations
                }
            }
        }
    }
}
