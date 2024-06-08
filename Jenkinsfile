pipeline {
    agent any
    
    stages {
        stage('SSH to Windows') {
            steps {
                script {
                    // Define SSH credentials (use Jenkins credentials ID)
                    def remote = [:]
                    remote.name = 'ServerCore'
                    remote.host = '192.168.100.5'
                    remote.user = 'vboxuser'
                    remote.allowAnyHosts = true
                    remote.identityFile = '/var/lib/jenkins/.ssh/id_rsa'  // Or use Jenkins credentials
                    
                    // Execute SSH command
                    sshCommand remote: remote, command: "dir"
                    
                    // Use SCP to copy file without password (assumes SSH key is configured correctly)
                    sh 'scp -i /var/lib/jenkins/.ssh/id_rsa -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/AD-pipeline/ad-ps.ps1 vboxuser@192.168.100.5:C:/Users/vboxuser/ad-ps.ps1'
                }
            }
        }
    }
}
