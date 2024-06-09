pipeline {
    agent any

    environment {
        SSH_CREDENTIALS_ID = 'win22-creds' // Jenkins credentials ID for SSH
        WINDOWS_HOST = '192.168.100.7'
        WINDOWS_USER = 'win22'
        COMMAND_TO_RUN = 'dir C:\\' // Command to run on the Windows VM
        KNOWN_HOSTS_FILE = '~/.ssh/known_hosts' // Path to the known_hosts file
    }

    stages {
        stage('SSH to Windows VM') {
            steps {
                script {
                    // Define the remote configuration including the 'name' and 'knownHosts' fields
                    def remote = [
                        name: '192.168.100.7', // A unique name for this SSH connection
                        host: env.WINDOWS_HOST, 
                        user: env.WINDOWS_USER, 
                        credentialsId: env.SSH_CREDENTIALS_ID,
                        knownHostsFile: env.KNOWN_HOSTS_FILE // Path to known_hosts file
                        allowAnyHosts = true 
                    ]

                    // Execute the SSH command using the defined remote configuration
                    sshCommand remote: remote, command: env.COMMAND_TO_RUN
                }
            }
        }
    }
}
