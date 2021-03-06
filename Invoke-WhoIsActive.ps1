function Invoke-WhoIsActive {
[CmdletBinding()]
    Param
    (       
        [Parameter(Mandatory=$true)]     
        [hashtable] 
        $SqlCredHash,
        
        [ValidateScript({ ($_ -gt 0) -or ($_ = $null) })]
        [Parameter()]    
        [int] 
        $Minutes = 1

    )

    process {
          
        Try {

            $timeRange = 1..$Minutes
        
            foreach($minute in $timeRange){

                Run-WhoIsActive -SqlCredHash $SqlCredHash

                Write-Verbose "$minute complete" 

            }
        }
        Finally {

            Release-WhoIsActiveLock -SqlCredHash $SqlCredHash

        }
    }
}
