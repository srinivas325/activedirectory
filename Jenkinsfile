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
                        user: 'vboxuser', // Username for WinRM authentication
                        password: 'changeme' // Password for WinRM authentication
                    ]
                    
                    // Execute PowerShell command on the Windows server
                    sh "winrm -hostname ${windowsServer.host} -username ${windowsServer.user} -password ${windowsServer.password} powershell '${powershellCommand}'"
                }
            }
        }
    }
}
