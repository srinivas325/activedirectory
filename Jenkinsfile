pipeline {
    agent any
    environment {
        // Define your environment variables here if needed
        // For example, if these are sensitive data, you can use credentials binding
        HOST_NAME = 'ServerCore'
        CREDENTIALS_ID = 'win-ad-vm'
    }
    stages {
        stage('Setup WinRM Client') {
            steps {
                script {
                    // Ensure that winRMOperations is defined
                    def winRMOperations = [] // Initialize or obtain this list as required
                    
                    // Call winRMClient with required parameters
                    winRMClient(
                        hostName: "${env.HOST_NAME}",
                        credentialsId: "${env.CREDENTIALS_ID}",
                        winRMOperations: winRMOperations
                    ) {
                        // Define what to do within the winRMClient block
                        echo "WinRM client setup complete"
                    }
                }
            }
        }
    }
}
