Function Get-NinjaAlert {

    <#

    .SYNOPSIS
        

    .DESCRIPTION
        

    .EXAMPLE
        

    #>

    [CmdletBinding(

        DefaultParameterSetName = 'AllAlerts',
        HelpUri = 'https://github.com/MaxAnderson95/PoSHNinjaRMM-Management'

    )]

    Param (

        #Returns all alerts
        [Parameter(ParameterSetName='AllAlerts')]
        [Alias("All")]
        [Switch]$AllAlerts

    )

    Begin {

        Write-Verbose -Message "Parameter Set name being used is $($PSCmdlet.ParameterSetName)"
        Write-Debug "Provided Parameter values are"    
        Write-Debug "DeviceID: $DeviceID"
        Write-Debug "DeviceName: $DeviceName"
        Write-Debug "All Devices: $AllDevices"

        #Define the AccessKeyID and SecretAccessKeys
        Try {
            
            $Keys = Get-NinjaAPIKeys
            Write-Debug "Using Nija API Keys: "
            Write-Debug $Keys

        } 
        
        Catch {
            
            Throw $Error
        
        }
    
        #Create an empty output array
        $OutputArray = @()

        Write-Warning -Message "This uses a List API and is rate limited to 10 requests per 10 minutes by Ninja"

    }

    Process {

        Switch ($PSCmdlet.ParameterSetName) {

            "AllAlerts" {

                $Rest = Invoke-NinjaAPIRequest -HTTPVerb GET -Resource /v1/alerts -AccessKeyID $Keys.AccessKeyID -SecretAccessKey $Keys.SecretAccessKey
                $OutputArray += $Rest

            }

        }

    }

    End {

        Write-Output $OutputArray

    }

}