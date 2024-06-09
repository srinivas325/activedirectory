pipeline {
    agent any

    environment {
        SSH_CREDENTIALS_ID = 'win22-creds' // Jenkins credentials ID for SSH
        WINDOWS_HOST = '192.168.100.7'
        WINDOWS_USER = 'win22'
        COMMAND_TO_RUN = 'dir C:\\' // Command to run on the Windows VM
    }

    stages {
        stage('SSH to Windows VM') {
            steps {
                script {
                    sshCommand remote: [ 
                        host: env.WINDOWS_HOST, 
                        user: env.WINDOWS_USER, 
                        credentialsId: env.SSH_CREDENTIALS_ID 
                    ], 
                    command: env.COMMAND_TO_RUN
                }
            }
        }
    }
}
