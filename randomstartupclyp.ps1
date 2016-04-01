<#

.SYNOPSIS
Plays a random song at startup

.DESCRIPTION
Creates a link to the current annoyingclyp.ps1 path, and adds it to the startup path

.EXAMPLE
./randomstartupclyp.ps1

.NOTES
This will not work if a user has startup disabled

.LINK
https://github.com/rguerra712/Pranks

#>

$scriptPath = "$PSScriptRoot\annoyingclyp.ps1"
$lnkPath = "$scriptPath.lnk"
Write-Output $scriptPath
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$lnkPath")
$Shortcut.TargetPath = "$scriptPath"
$Shortcut.Save()

$pathStartup = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"

Move-Item $lnkPath $pathStartup