pipeline {
    agent any
    
    stages {
        stage('SSH to Windows') {
            steps {
                script {
                    // Define SSH credentials
                    def remote = [:]
                    remote.name = 'ServerCore'
                    remote.host = '192.168.100.5'
                    remote.user = 'vboxuser'
                    remote.password= 'changeme'
                    remote.allowAnyHosts = true

                    
                    // Define SSH command to execute on Windows
                    //remoteServer.command = '''powershell.exe Get-ADUser -Identity ChewDavid -Properties *'''
                    
                    // Execute SSH command
                    sshCommand remote: remote, command: "dir"
					sh 'scp -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/AD-pipeline/ad-ps.ps1 vboxuser@192.168.100.5:C:/Users/vboxuser/ad-ps.ps1'
                }
            }
        }
    }
}
