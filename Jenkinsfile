pipeline {
    agent any
    
    stages {
        stage('SSH to Windows') {
            steps {
script{
    sshagent (credentials: ['win22-creds']) {
        sh '''
            ssh -o StrictHostKeyChecking=no win22@192.168.100.7 "
                cd
            "
        '''
    }
}
        }
    }
}

}
