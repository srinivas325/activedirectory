pipeline {
    agent any

    stages {
        stage('Copy and Execute PowerShell Script') {
            steps {
                script {
                    // Define SSH credentials
                    def remote = [:]
                    remote.name = 'ServerCore'
                    remote.host = '192.168.100.5'
                    remote.user = 'vboxuser'
                    remote.password = 'changeme'
                    remote.allowAnyHosts = true

                    // Copy the PowerShell script to the remote server
                    sshPut remote: remote, from: 'ad-ps.ps1', into: 'C:/Users/vboxuser/'

                     // Verify the script is copied
                    sshCommand remote: remote, command: "dir C:\\Users\\vboxuser\\"

                    // Execute the PowerShell script on the remote server
                    sshCommand remote: remote, command: 'powershell.exe -File C:\\Users\\vboxuser\\ad-ps.ps1'
                }
            }
        }
    }
}
