pipeline {
    agent any
    
    stages {
        stage('SSH to Windows') {
            steps {
                script {
                    // Define SSH credentials
                    def remoteServer = [:]
                    remoteServer.host = '192.168.100.5'
                    remoteServer.user = 'vboxuser'
                    remoteServer.password = 'changeme'
                    
                    // Define SSH command to execute on Windows
                    remoteServer.command = '''powershell.exe Get-ADUser -Identity ChewDavid -Properties *'''
                    
                    // Execute SSH command
                    sshCommand remote: remoteServer
                }
            }
        }
    }
}
