Function Set-NinjaAPIKeys {

    PARAM
    (

    )

    Begin
    {
        
    }

    Process
    {
        $creds = Get-Credential
        New-StoredCredential -Target "https://api.ninjarmm.com/v1/" -Username $creds.UserName -SecurePassword $creds.Password
    }

    End
    {

    }

}