Function Remove-NinjaApiKeys {

    PARAM
    (
        [Switch]$Force
    )

    Begin
    {
        
    }

    Process
    {
        If (!$Force) 
        {
        
            $title = $Null
            $message = "Delete Ninja API keys from the credential store?"
            
            $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", "API Keys WILL be deleted from the credential store"
            $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", "API keys will NOT be deleted from the credential store"

            $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)

            $result = $host.ui.PromptForChoice($title, $message, $Options, 0)

            Switch ($result)
                {
                    0 { Remove-StoredCredential -Target "https://api.ninjarmm.com/v1/" }
                    1 { Write-Output "Did NOT remove API keys." }
                }
        }

        If ($Force) 
        {
            Remove-StoredCredential -Target "https://api.ninjarmm.com/v1/"
        }
    }

    End
    {

    }

}