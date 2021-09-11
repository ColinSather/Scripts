# Notes

[Ref 1](https://adamtheautomator.com/powershell-environment-variables/#Setting_or_Creating_an_Environment_Variable_with_Env)
```
PS51> "The Computer Name is {0}" -f $env:computername
The Computer Name is WIN10-1809
PS51> "The Computer Name is $env:computername"
The Computer Name is WIN10-1809
```
