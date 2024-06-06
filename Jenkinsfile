pipeline {
    agent any
    environment {
        HOST_NAME = 'ServerCore' // Replace with your actual host name
        CREDENTIALS_ID = 'win-ad-vm' // Replace with your actual credentials ID
    }
    stages {
        stage('Execute PowerShell Command') {
            steps {
                script {
                    // Define the PowerShell command to execute
                    def command = 'Get-ADUser -Identity ChewDavid -Properties *'

                    // Call the function to execute the PowerShell command and capture the output
                    def result = executePowerShellCommand("${env.HOST_NAME}", "${env.CREDENTIALS_ID}", command)
                    echo "PowerShell command output: ${result}"
                }
            }
        }
    }
}

// Function to execute PowerShell command via WinRM and capture the output
def executePowerShellCommand(String hostName, String credentialsId, String command) {
    def output = ''
    def error = ''

    withCredentials([usernamePassword(credentialsId: credentialsId, usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
        def script = """
        \$secpasswd = ConvertTo-SecureString '${env.PASSWORD}' -AsPlainText -Force
        \$mycreds = New-Object System.Management.Automation.PSCredential ('${env.USERNAME}', \$secpasswd)
        \$session = New-PSSession -ComputerName ${hostName} -Credential \$mycreds
        \$result = Invoke-Command -Session \$session -ScriptBlock { ${command} } -ErrorAction Stop
        Remove-PSSession -Session \$session
        \$result
        """
        try {
            output = powershell(script: script, returnStdout: true, encoding: 'UTF-8')
        } catch (Exception e) {
            error = e.getMessage()
        }
    }

    if (error) {
        error "Error executing PowerShell command: ${error}"
    }

    return output.trim()
}
