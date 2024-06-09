param (
    [string]$UserName
)

# Import Active Directory module
Import-Module ActiveDirectory

# Get the user object
$User = Get-ADUser -Identity $UserName

# Find the group name to which the user belongs
$Groups = Get-ADPrincipalGroupMembership -Identity $UserName | Select-Object -ExpandProperty Name

# Apply a policy to the group (assuming you have a policy named "TestPolicy")
foreach ($Group in $Groups) {
    $Policy = Get-ADFineGrainedPasswordPolicy -Filter { AppliesTo -like $Group }
    if ($Policy) {
        Write-Host "Policy applied to group $Group."
        # Add code to apply the policy to the group here
    } else {
        Write-Host "No policy found for group $Group."
    }
}
