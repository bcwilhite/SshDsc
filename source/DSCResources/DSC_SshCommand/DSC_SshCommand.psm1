<#
    .SYNOPSIS
        Gets the current state of the computer.
#>
function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [String]
        $SshTestCommand,

        [Parameter(Mandatory = $true)]
        [String]
        $SshTestCommandValue,

        [Parameter(Mandatory = $true)]
        [String]
        $SshSetCommand,

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SshSessionCredential
    )

}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [String]
        $SshSetCommand,

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SshSessionCredential
    )

}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [String]
        $SshTestCommand,

        [Parameter(Mandatory = $true)]
        [String]
        $SshTestCommandValue,

        [Parameter(Mandatory = $true)]
        [String]
        $SshSetCommand,

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SshSessionCredential
    )

    $getResults = Get-TargetResource @PSBoundParameters

    if ($SshTestCommandValue -ne $getResults.SshTestCommandValue)
    {
        return $false
    }
    else
    {
        return $true
    }
}