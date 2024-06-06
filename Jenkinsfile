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
                    def windowsServerHost = '192.168.100.5' // Hostname for the SSH remote host
                    
                    // Check if the SSH remote host configuration is available
                    def sshHosts = jenkins.model.Jenkins.instance.getDescriptor('org.jenkinsci.plugins.sshsteps.SSHUserPrivateKey').getSSHHosts()
                    if (sshHosts.containsKey(windowsServerHost)) {
                        // Execute PowerShell command on the Windows server using SSH remote host
                        sshCommand remote: windowsServerHost, command: "powershell.exe -Command '${powershellCommand}'"
                    } else {
                        error "SSH Remote Host configuration '${windowsServerHost}' not found."
                    }
                }
            }
        }
    }
}
