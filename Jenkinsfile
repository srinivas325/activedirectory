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

                        # Define user properties
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

                        `$output | ConvertTo-Json
                    """

                    bat """
                        echo ${script} > script.ps1
                    """

                    powershell(
                        script: """
                            \$username = "${username}"
                            \$password = "${env.WINRM_PASSWORD}" | ConvertTo-SecureString -AsPlainText -Force
                            \$credential = New-Object System.Management.Automation.PSCredential("${env.WINRM_USER}", \$password)
                            Invoke-Command -ComputerName "${env.WINRM_HOST}" -Port ${env.WINRM_PORT} -Credential \$credential -FilePath "script.ps1"
                        """,
                        label: "Running PowerShell Script on Windows VM"
                    )
                }
            }
        }
    }
}
