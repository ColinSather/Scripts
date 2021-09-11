# TODO: check if computer is online first

# Query a specific domain
if ($args[1]) {
    Get-WmiObject Win32_OperatingSystem -ComputerName $args[0] -Server $args[1] |
    Select-Object PSComputerName, Caption, OSArchitecture, Version, BuildNumber | Format-List    
}
# Query default domain
else {
    Get-WmiObject Win32_OperatingSystem -ComputerName $args[0] |
    Select-Object PSComputerName, Caption, OSArchitecture, Version, BuildNumber | Format-List    
}
