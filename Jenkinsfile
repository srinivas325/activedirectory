pipeline {
    agent any

    stages {
        stage('Copy PS') {
            steps {
script{
    sshagent (credentials: ['win22-creds']) {
        sh '''
            sh 'scp -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/AD-pipeline/ad-ps.ps1 win22@192.168.100.7:C:/Users/win22/ad-ps.ps1'
            "
        '''
        
    }
}
        }
    }
}
    
    stages {
        stage('SSH to Windows') {
            steps {
script{
    sshagent (credentials: ['win22-creds']) {
        sh '''
            ssh -o StrictHostKeyChecking=no win22@192.168.100.7 "
            dir
            "
        '''
        
    }
}
        }
    }
}

}
