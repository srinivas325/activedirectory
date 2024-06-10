param (
    [string]$UserName,
    [string]$PolicyName
)

$GroupName = "TestGroup"

# Validate that the parameters are not null or empty
if ([string]::IsNullOrEmpty($UserName)) {
    Write-Host "Error: The 'UserName' parameter is required and cannot be null or empty."
    exit 1
}

if ([string]::IsNullOrEmpty($PolicyName)) {
    Write-Host "Error: The 'PolicyName' parameter is required and cannot be null or empty."
    exit 1
}

# Import Active Directory module
Import-Module ActiveDirectory -ErrorAction Stop

try {
    # Check if the user exists
    $User = Get-ADUser -Filter { SamAccountName -eq $UserName }

    if (!$User) {
        # If the user doesn't exist, create the user
        Write-Host "User '$UserName' not found. Creating user..."
        $UserParams = @{
            Name = $UserName
            SamAccountName = $UserName
            AccountPassword = (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force)
            Enabled = $true
            ErrorAction = 'Stop'
        }
        New-ADUser @UserParams
        Write-Host "User '$UserName' created successfully."
    } else {
        Write-Host "User found: $($User.Name)"
    }

    # Add the user to the group
    Add-ADGroupMember -Identity $GroupName -Members $UserName -ErrorAction Stop

    Write-Host "$UserName has been added to $GroupName."
    
    # Optionally: Apply a policy to the group (if you have such requirements)
    # Create a fine-grained password policy

    # Create a fine-grained password policy
    $PasswordPolicy = @{
        Name = $PolicyName
        Precedence = 1
        ComplexityEnabled = $true
        MinPasswordLength = 8
        MaxPasswordAge = (New-TimeSpan -Days 90)
    }

    # Create the fine-grained password policy
    New-ADFineGrainedPasswordPolicy @PasswordPolicy -ErrorAction Stop

    # Apply the policy to the group
    Add-ADFineGrainedPasswordPolicySubject -Identity $PolicyName -Subjects $GroupName -ErrorAction Stop

    # Apply the policy to the user
    Add-ADFineGrainedPasswordPolicySubject -Identity $PolicyName -Subjects $UserName -ErrorAction Stop

    Write-Host "AD user, group, and policy applied successfully."

} catch {
    Write-Host "Error: $_"
}
