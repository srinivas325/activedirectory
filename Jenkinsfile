pipeline {
    agent any

    environment {
        REMOTE_SERVER = '192.168.100.7'  // IP of the remote Windows server
        REMOTE_USER = 'win22'            // Username on the remote Windows server
        SCRIPT_PATH = 'C:/Users/win22/ad-ps.ps1'  // Path to place the script on the remote server
    }

    // Define the pipeline parameter
    parameters {
        string(name: 'USERNAME', defaultValue: 'jdoe', description: 'Enter the Active Directory username')
    }

    stages {
        stage('Copy PowerShell Script to Windows Server') {
            steps {
                script {
                    sshagent(credentials: ['win22-creds']) {
                        sh '''
                            echo "Copying PowerShell script to the remote Windows server..."
                            scp -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/AD-pipeline/ad-ps.ps1 ${REMOTE_USER}@${REMOTE_SERVER}:${SCRIPT_PATH}
                        '''
                    }
                }
            }
        }

        stage('Execute PowerShell Script on Windows Server') {
            steps {
                script {
                    sshagent(credentials: ['win22-creds']) {
                        sh """
                            echo "Executing PowerShell script on the remote Windows server..."
                            ssh -o StrictHostKeyChecking=no ${REMOTE_USER}@${REMOTE_SERVER} \\
                                "powershell -File ${SCRIPT_PATH} -Username '${params.USERNAME}'"
                        """
                    }
                }
            }
        }
    }
}
