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
                        host: '192.168.100.5', // IP address or hostname of the Windows server
                        user: 'vboxuser', // Username for SSH authentication
                        password: 'changeme' // Password for SSH authentication
                    ]
                    
                    // Execute PowerShell command on the Windows server using SSH
                    sh "sshpass -p ${windowsServer.password} ssh ${windowsServer.user}@${windowsServer.host} \"powershell.exe -Command '${powershellCommand}'\""
                }
            }
        }
    }
}
