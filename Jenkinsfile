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
                    
                    // Define the target Windows server SSH remote host
                    def windowsServer = [
                        name: '192.168.100.5' // Name for reference in Jenkins configuration
                    ]
                    
                    // Execute PowerShell command on the Windows server using SSH remote host
                    sshCommand remote: windowsServer.name, command: "powershell.exe -Command '${powershellCommand}'"
                }
            }
        }
    }
}
