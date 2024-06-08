pipeline {
    agent any
    
    stages {
        stage('SCP to Windows using PSCP') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'win-ad-vm', usernameVariable: 'REMOTE_USER', passwordVariable: 'REMOTE_PASSWORD')]) {
                    script {
                        // Define remote details
                        def remoteHost = '192.168.100.5'
                        def localFile = '/var/lib/jenkins/workspace/AD-pipeline/ad-ps.ps1'
                        def remotePath = 'C:/Users/vboxuser/ad-ps.ps1'
                        
                        // Use PSCP to copy file to Windows
                        sh """
                        pscp -pw ${REMOTE_PASSWORD} -batch -scp ${localFile} ${REMOTE_USER}@${remoteHost}:${remotePath}
                        """
                    }
                }
            }
        }
    }
}
