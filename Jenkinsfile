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

                    // Define local and remote paths
                    def localScriptPath = "${env.WORKSPACE}/ad-ps.ps1"
                    def remoteScriptPath = 'C:\\Users\\vboxuser\\ad-ps.ps1'

                    // Debug: Print paths
                    echo "Local script path: ${localScriptPath}"
                    echo "Remote script path: ${remoteScriptPath}"

                   // Copy the PowerShell script to the remote server using scp
                    sh """
                        scp -o StrictHostKeyChecking=no ${localScriptPath} ${remote.user}@${remote.host}:C:\\Users\\vboxuser\\ad-ps.ps1
                    """

                     // Verify the script is copied
                    sshCommand remote: remote, command: "dir C:\\Users\\vboxuser\\"

                    // Execute the PowerShell script on the remote server
                    sshCommand remote: remote, command: "powershell.exe -File ${remoteScriptPath}"

                }
            }
        }
    }
}
