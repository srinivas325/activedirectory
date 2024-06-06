pipeline {
    agent any
    
    stages {
        stage('SSH to Windows') {
            steps {
                script {
                    // Define SSH credentials
                    def remoteServer = [:]
                    remoteServer.name = 'ServerCore'
                    remoteServer.host = '192.168.100.5'
                    remoteServer.user = 'vboxuser'
                    remoteServer.password = 'changeme'
                    
                    // Define SSH command to execute on Windows
                    remoteServer.command = '''powershell.exe -ExecutionPolicy Bypass -File C:\\path\\to\\your\\script.ps1'''
                    
                    // Execute SSH command
                    sshCommand remoteServer
                }
            }
        }
    }
}
