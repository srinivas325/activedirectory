param (
    [string]$UserName,
    [string]$PasswordPolicyName
)

$GroupName = "TestGroup"

# Validate that the parameters are not null or empty
if ([string]::IsNullOrEmpty($UserName)) {
    Write-Host "Error: The 'UserName' parameter is required and cannot be null or empty."
    exit 1
}

if ([string]::IsNullOrEmpty($PasswordPolicyName)) {
    Write-Host "Error: The 'PasswordPolicyName' parameter is required and cannot be null or empty."
    exit 1
}

# Debugging: Print the username and group name to verify
Write-Host "Username: $UserName"

# Import Active Directory module
Import-Module ActiveDirectory

# Debugging: Print the domain controller information
Write-Host "Domain Controller: $env:USERDOMAIN"

# Try to get the user object
try {
    $User = Get-ADUser -Identity $UserName -ErrorAction Stop
    Write-Host "User found: $($User.Name)"
    Get-ADUser -Identity $UserName -Properties *

    # Check if the user is a member of the specified group
    $IsMember = Get-ADGroupMember -Identity $GroupName -Recursive | Where-Object {$_.SamAccountName -eq $User.SamAccountName}

    if ($IsMember) {
        Write-Host "$UserName is already a member of $GroupName."
    } else {
        # If the user is not a member, add them to the group
        Add-ADGroupMember -Identity $GroupName -Members $User
        Write-Host "$UserName has been added to $GroupName."
    }
    
    # Optionally: List all groups the user is a member of (for informational purposes)
    $Groups = Get-ADPrincipalGroupMembership -Identity $User | Select-Object -ExpandProperty Name
    Write-Host "$UserName belongs to the following groups:"
    Write-Host $Groups -Separator ", "
    
    # Optionally: Apply a policy to the group (if you have such requirements)
    # Create a fine-grained password policy

    # Create a fine-grained password policy
    $PasswordPolicy = @{
        Name = $PasswordPolicyName
        Precedence = 1
        ComplexityEnabled = $true
        MinPasswordLength = 8
        MaxPasswordAge = (New-TimeSpan -Days 90)
    }

    # Create the fine-grained password policy
    New-ADFineGrainedPasswordPolicy @PasswordPolicy

    # Apply the policy to the group
    Add-ADFineGrainedPasswordPolicySubject -Identity $PasswordPolicyName -Subjects $GroupName

    # Apply the policy to the user
    Add-ADFineGrainedPasswordPolicySubject -Identity $PasswordPolicyName -Subjects $UserName

    Write-Host "AD user, group, and policy applied successfully."

} catch {
    Write-Host "Error: $_"
}
