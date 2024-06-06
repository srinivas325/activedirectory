pipeline {
    agent any
    environment {
        HOST_NAME = 'ServerCore' // Example value, use your actual hostname
        CREDENTIALS_ID = 'win-ad-vm' // Example value, use your actual credentials ID
    }
    stages {
        stage('Setup WinRM Client') {
            steps {
                script {
                    // Initialize winRMOperations
                    def winRMOperations = [] // Initialize or obtain this list as required

                     // Define the PowerShell command to execute
                    def command = 'Get-Process'

                    // Call winRMClient with correct named parameters
                    winRMClient(
                        hostName: "${env.HOST_NAME}",
                        credentialsId: "${env.CREDENTIALS_ID}",
                        winRMOperations: winRMOperations
                    )
                }
            }
        }
    }
}

def winRMClient(Map params) {
    def hostName = params.hostName
    def credentialsId = params.credentialsId
    def winRMOperations = params.winRMOperations

    // Implement your logic here
    echo "HostName: ${hostName}, CredentialsId: ${credentialsId}, WinRMOperations: ${winRMOperations.size()}"
}
