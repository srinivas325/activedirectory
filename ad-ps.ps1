param (
    [string]$UserName
)

# Debugging: Print the username to verify
Write-Host "Username: $UserName"

# Import Active Directory module
Import-Module ActiveDirectory

# Debugging: Print the domain controller information
Write-Host "Domain Controller: $env:USERDOMAIN"

# Try to get the user object
try {
    $User = Get-ADUser -Identity $UserName -ErrorAction Stop
    Write-Host "User found: $($User.Name)"
    
    # Find the group name to which the user belongs
    $Groups = Get-ADPrincipalGroupMembership -Identity $User | Select-Object -ExpandProperty Name

    # Apply a policy to the group (assuming you have a policy named "TestPolicy")
    foreach ($Group in $Groups) {
        $Policy = Get-ADFineGrainedPasswordPolicy -Filter { AppliesTo -like $Group }
        if ($Policy) {
            # Add code to apply the policy to the group here
            # Apply the policy to the group
             Get-ADFineGrainedPasswordPolicy -Identity "TestPolicy"
             Add-ADFineGrainedPasswordPolicySubject -Identity $Policy -Subjects "TestGroup"
            Write-Host "AD user, group, and policy applied successfully."
        } else {
            Write-Host "No policy found for group $Group."
        }
    }
} catch {
    Write-Host "Error: $_"
}
