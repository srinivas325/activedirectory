param (
    [string]$Username
)

# Check if the Active Directory module is available
if (-not (Get-Module -ListAvailable -Name ActiveDirectory)) {
    Write-Error "The Active Directory module is not available on this system."
    exit
}

# Import the Active Directory module
Import-Module ActiveDirectory

try {
    # Get user details
    $user = Get-ADUser -Identity $Username -Properties DisplayName, EmailAddress, MemberOf

    if ($user -eq $null) {
        Write-Error "User '$Username' not found in Active Directory."
        exit
    }

    # Display user details
    Write-Output "User Details:"
    Write-Output "=============="
    Write-Output "Name: $($user.DisplayName)"
    Write-Output "Email: $($user.EmailAddress)"
    Write-Output ""

    # Get and display group membership
    Write-Output "Groups:"
    Write-Output "======="
    $groups = $user.MemberOf | Get-ADGroup | Select-Object -Property Name
    $groups | ForEach-Object { Write-Output $_.Name }

    # Example policy application: Adding the user to a specific group (if not already a member)
    $policyGroupName = "YourPolicyGroupName"  # Change this to the appropriate group name
    $policyGroup = Get-ADGroup -Identity $policyGroupName

    if ($null -eq $policyGroup) {
        Write-Error "Policy group '$policyGroupName' not found in Active Directory."
        exit
    }

    if ($groups.Name -notcontains $policyGroupName) {
        Write-Output "Adding user '$Username' to the policy group '$policyGroupName'."
        Add-ADGroupMember -Identity $policyGroupName -Members $user.SamAccountName
        Write-Output "User added to the group successfully."
    } else {
        Write-Output "User '$Username' is already a member of the policy group '$policyGroupName'."
    }

} catch {
    Write-Error "An error occurred: $_.Exception.Message"
}

