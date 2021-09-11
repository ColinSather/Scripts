<#
SHEW is a powershell script that assists with executing shell scripts on Windows machines.
This script is to be added to the system's path variable and enable the user to execute shell scripts by an inputed index number.

POWERSHELL USAGE:
-----------------
$ shew

---------------------
Available Scripts
---------------------
C:\Users\Username\path_to\Bash\script1.sh
C:\Users\Username\path_to\Bash\script2.sh
C:\Users\Username\path_to\Bash\script3.sh
-------------------------------------------------------
Select a script by entering an index between 0 and 2:
$ 0
Executing script:
C:\Users\Username\path_to\Bash\script1.sh
#>

$scripts_dir = "C:\Users\csather\Desktop\Scripts\Bash\"
$scripts_arr = Get-ChildItem $scripts_dir -Filter *.sh 

echo "---------------------"
echo "Available Scripts"
echo "---------------------"

$counter = 0

$scripts_arr | Foreach-Object {
    echo $_.FullName
}

echo "-------------------------------------------------------"
$prompt = "Select a script by entering an index between 0 and"
$max = $scripts_arr.count -1
$selection = Read-Host $prompt $max

$prompt = "Executing script:" 
echo $prompt $scripts_arr[$selection].FullName
sh $scripts_arr[$selection]
