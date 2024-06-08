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
                    remote.password= 'changeme'
                    remote.allowAnyHosts = true
                    def localFile = '/var/lib/jenkins/workspace/AD-pipeline/ad-ps.ps1'
                    def remotePath = 'C:/Users/vboxuser/ad-ps.ps1'
                    
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
