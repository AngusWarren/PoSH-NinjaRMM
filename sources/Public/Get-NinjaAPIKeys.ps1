Function Get-NinjaAPIKeys {

    PARAM
    (

    )

    Begin
    {

    }

    Process
    {
        $StoredCredential = Get-StoredCredential -Target "https://api.ninjarmm.com/v1/"
        $AccessKeyID = $StoredCredential.UserName
        $SecretAccessKey = $StoredCredential.GetNetworkCredential().Password
    }

    End
    {
        If ($AccessKeyID -eq $Null -or $SecretAccessKey -eq $Null) 
        {
            Write-Error "The Ninja API keys not set in the credential store, use Set-NinjaKeys to set them"
        }
        
        Else 
        {
            Write-Output @{"AccessKeyID" = $AccessKeyID; "SecretAccessKey" = $SecretAccessKey}
        }
    }

}