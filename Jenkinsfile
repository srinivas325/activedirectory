pipeline {
    agent any
    
    stages {
        stage('SSH to Windows') {
            steps {
                script {
                    // Define SSH credentials
                    def remote = [:]
                    //remote.name = 'ad'
                    remote.host = '192.168.100.7'
                    remote.user = 'win22'
                    remote.password= 'changeme'
                    remote.allowAnyHosts = true

                    
                    // Define SSH command to execute on Windows
                    remoteServer.command = '''powershell.exe Get-ADUser -Identity ChewDavid -Properties *'''
                    
                    // Execute SSH command
                    sshCommand remote: remote, command: "dir"
			sh 'scp -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/AD-pipeline/ad-ps.ps1 win22@192.168.100.7:C:/Users/win22/ad-ps.ps1'
					
                }
            }
        }
    }
}
