pipeline {
    agent any
    stages {
        stage('Deploy') {
            steps {
                sshagent(['192.168.100.5']) {
                    sh 'scp -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/AD-pipeline/ad-ps.ps1 vboxuser@192.168.100.5:C:/Users/vboxuser/ad-ps.ps1'
                }
            }
        }
    }
}
