<#
This script gets the local admin password and a readable password expiration time for a given computer.
The script will query the network's default domain if the server variable is null.
#>
Param(
    [Parameter(Mandatory=$true)]
    [Alias("CN","MachineName")]
    [String] $computer,

    [Parameter(Mandatory=$false)]
    [String] $server
	
)

$term = "tmp"
$search_like = Get-ADComputer -Filter * | Where-Object {$_.Name -like $term} | Select -Property Name

Function Get-Pswd() {
    if ($server) {
        # next 3 lines are all one AD query
        get-adcomputer $computer -properties * -server $server | Select-Object ms-mcs-admpwd, name, enabled,
        @{Name="ms-mcs-admpwdexpirationtime";
        Expression={$([datetime]::FromFileTime([convert]::ToInt64($_."ms-MCS-AdmPwdExpirationTime",10)))}} | Format-List
    }
	
    else {
        # next 3 lines are all one AD query
        get-adcomputer $computer -properties * | Select-Object ms-mcs-admpwd, name, enabled, 
        @{Name="ms-mcs-admpwdexpirationtime";
        Expression={$([datetime]::FromFileTime([convert]::ToInt64($_."ms-MCS-AdmPwdExpirationTime",10)))}} | Format-List
    }
}

# Entry point / main execution area
Get-Pswd $computer $server
