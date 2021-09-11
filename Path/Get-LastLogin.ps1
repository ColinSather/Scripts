If (-Not $args[0]) {
    Read-Host "test"
    Write-Host $test
}
else {
    get-adcomputer $args[0] -properties lastlogon -server $args[1] | 
    Select-Object @{Name="lastlogon"; 
    Expression={$([datetime]::FromFileTime([convert]::ToInt64($_."lastlogon",10)))}} | 
    Format-List
}
