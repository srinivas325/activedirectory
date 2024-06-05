pipeline {
    agent any

    parameters {
        string(name: 'USERNAME', defaultValue: '', description: 'Username to fetch details for and apply policy')
    }

    environment {
        WINRM_HOST = '192.168.100.5'
        WINRM_PORT = '5985'
        WINRM_USER = 'vboxuser'
        WINRM_PASSWORD = 'changeme'
    }

    stages {
        stage('Run PowerShell Script on Windows VM') {
            steps {
                script {
                    def username = params.USERNAME
                    def script = """
                        param (
                            [string]`$username
                        )

                        # Import the Active Directory module if it's not already imported
                        Import-Module ActiveDirectory

                        # Fetch user details
                        `$user = Get-ADUser -Identity `$username -Properties DisplayName, EmailAddress

                        # Get group membership
                        `$groups = Get-ADUser -Identity `$username -Properties MemberOf | Select-Object -ExpandProperty MemberOf

                        # Apply policy (example policy - add user to a specific group if not already a member)
                        `$policyGroup = "PolicyGroup"
                        if (`$groups -notcontains `$policyGroup) {
                            Add-ADGroupMember -Identity `$policyGroup -Members `$username
                            Write-Output "User `$username added to policy group `$policyGroup."
                        } else {
                            Write-Output "User `$username is already a member of policy group `$policyGroup."
                        }

                        # Output user details and groups
                        `$output = @{
                            "Username" = `$user.SamAccountName
                            "DisplayName" = `$user.DisplayName
                            "Email" = `$user.EmailAddress
                            "Groups" = `$groups
                        }

                        # Convert the output to JSON
                        `$outputJson = `$output | ConvertTo-Json -Compress
                        Write-Output `$outputJson
                    """

                    // Write the PowerShell script to a file
                    writeFile file: 'script.ps1', text: script

                    // Run the PowerShell script on the Windows VM using WinRM
                    def output = powershell(returnStdout: true, script: """
                        \$username = "${username}"
                        \$password = "${env.WINRM_PASSWORD}" | ConvertTo-SecureString -AsPlainText -Force
                        \$credential = New-Object System.Management.Automation.PSCredential("${env.WINRM_USER}", \$password)
                        \$result = Invoke-Command -ComputerName "${env.WINRM_HOST}" -Port ${env.WINRM_PORT} -Credential \$credential -FilePath "script.ps1"
                        Write-Output \$result
                    """)

                    // Parse the JSON output from the PowerShell script
                    def json = readJSON text: output
                    echo "User Details: ${json.Username}"
                    echo "Display Name: ${json.DisplayName}"
                    echo "Email: ${json.Email}"
                    echo "Groups: ${json.Groups}"
                }
            }
        }
    }
}
