<# This script checks the currently running .vimrc file against my remote .vimrc file #>

$gist = "https://gist.githubusercontent.com/ColinSather/bb0b607a124b46c6279d15cf406491e7/raw/7d83fafd62bb1a184abc48495f0e352f4a0bf460/.vimrc"

$webreq = (Invoke-WebRequest -Uri $gist -UseBasicParsing).Content
#$remote = $webreq.Content
$local = type ~\.vimrc
$tmp = Get-Content ~\test.txt -Raw

echo $tmp
echo "--------------------"
echo $remote

#If ($tmp -eq $remote) {
If ($tmp.Trim() -eq $webreq.Trim()) {
	echo "yup"
} Else {
	echo "nahh"
}

<# If Invoke-WebRequest = .vimrc wget vimrc from gist #>


# wget $gist -O outfiles/remote-vimrc
