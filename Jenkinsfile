pipeline {
    agent any
    
    stages {
        stage('Connect to Windows Server') {
            steps {
                script {
                    // Define SSH credentials
                    def sshCredentials = [
                        $class: 'UsernamePasswordCredentialsBinding',
                        credentialsId: 'win-ad-vm',
                        usernameVariable: 'SSH_USERNAME',
                        passwordVariable: 'SSH_PASSWORD'
                    ]

                    // Define SSH command
                    def sshCommand = "ssh ${sshCredentials.usernameVariable}:${sshCredentials.passwordVariable}@192.168.100.5"

                    // Execute SSH command
                    def sshResult = bat(script: sshCommand, returnStdout: true)

                    // Print SSH result
                    echo "SSH result: ${sshResult}"
                }
            }
        }
        stage('Execute PowerShell Command') {
            steps {
                script {
                    // Define PowerShell command
                    def powerShellCommand = 'Your PowerShell command here'

                    // Execute PowerShell command remotely via SSH
                    def sshPowerShellCommand = "powershell.exe -command \"${powerShellCommand}\""
                    def sshPowerShellResult = bat(script: sshPowerShellCommand, returnStdout: true)

                    // Print PowerShell command result
                    echo "PowerShell result: ${sshPowerShellResult}"
                }
            }
        }
    }
}
