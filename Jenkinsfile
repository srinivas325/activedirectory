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
                    remote.identityFile = '/var/lib/jenkins/.ssh/id_ed25519'  // Or use Jenkins credentials
                    
                    // Execute SSH command
                    sshCommand remote: remote, command: "dir"
                    
                    // Use PSCP command to copy file to Windows
                    sh """
                    echo '${remotePassword}' | pscp -pw ${remotePassword} -r ${localFile} ${remoteUser}@${remoteHost}:${remotePath}
                    """
                }
            }
        }
    }
}
