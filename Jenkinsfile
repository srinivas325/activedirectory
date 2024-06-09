pipeline {
    agent any
    
    stages {
        stage('SSH to Windows') {
            steps {
                script {
                    // Load SSH credentials
                    def remote = [:]
                    remote.name = 'win22'
                    remote.host = '192.168.100.7'
                    remote.user = 'win22'
                    remote.allowAnyHosts = true
                    
                    // Load the SSH private key from Jenkins credentials
                    remote.identityFile = credentials('win22-creds')  // Replace with your credentials ID

                    // Execute SSH command
                    sshCommand remote: remote, command: "dir"
                    
                    // Securely copy the script to the remote server using SCP with SSH key
                    // sh "scp -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/AD-pipeline/ad-ps.ps1 ${remote.user}@${remote.host}:C:/Users/${remote.user}/ad-ps.ps1"
                }
            }
        }
    }
}
