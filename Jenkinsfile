pipeline {
    agent any
    
    stages {
        stage('Execute PowerShell on Windows') {
            steps {
                script {
                    // Define the PowerShell command you want to execute
                    def powershellCommand = '''
                        Write-Host "Hello from PowerShell"
                        # Add more PowerShell commands here
                    '''
                    
                    // Define the target Windows server details
                    def windowsServer = [
                        name: 'win-ssh-server', // Name for reference in Jenkins configuration
                        host: '192.168.100.5', // IP address or hostname of the Windows server
                        credentialsId: '192.168.100.5' // Jenkins credentials ID for SSH authentication
                    ]
                    
                    // Execute PowerShell command on the Windows server using SSH plugin
                    sshPublisher(
                        publishers: [
                            sshPublisherDesc(
                                configName: windowsServer.name,
                                transfers: [
                                    sshTransfer(
                                        execCommand: "powershell.exe -Command '${powershellCommand}'"
                                    )
                                ]
                            )
                        ],
                        continueOnError: false
                    )
                }
            }
        }
    }
}
