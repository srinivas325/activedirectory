pipeline {
    agent any

    stages {
        stage('Connect to Windows Server') {
            steps {
                script {
                    // Define SSH credentials for connecting to the Windows server
                    def remote = [:]
                    remote.name = 'ServerCore'
                    remote.host = '192.168.100.5' // Replace with your Windows server hostname or IP address
                    remote.user = 'vboxuser' // Replace with your username
                    remote.identityFile = credentials('SSH_Credentials_ID') // Replace 'SSH_Credentials_ID' with the ID of your SSH private key credentials configured in Jenkins

                    // Connect to the Windows server via SSH
                    sshCommand remote: remote, command: 'echo Connected to Windows Server'
                }
            }
        }
        stage('Run PowerShell Command') {
            steps {
                script {
                    // Define PowerShell command to execute
                    def powershellCmd = 'Get-Process'

                    // Execute PowerShell command on the Windows server via SSH
                    sshCommand remote: remote, command: "powershell.exe -Command '${powershellCmd}'"
                }
            }
        }
    }
}
