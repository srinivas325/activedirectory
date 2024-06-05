pipeline {
    agent any

    parameters {
        string(name: 'USERNAME', defaultValue: '', description: 'Username to fetch details for and apply policy')
    }

    // environment {
    //     WINRM_HOST = '192.168.100.5'
    //     WINRM_PORT = '5985'
    //     WINRM_USER = 'vboxuser'
    //     WINRM_PASSWORD = 'changeme'
    // }

    stages {
        stage('Run PowerShell Script on Windows VM') {
           steps {
               winRMClient {
        hostName('192.168.100.5')
        credentialsId('win-ad-vm')
        invokeCommand('dir')
      }
            
    //         {
    //            powershell '''
    //                New-ADUser -Name "testuser" 3
    //                '''   
    // }
}
    }
}
