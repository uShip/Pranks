<#

.SYNOPSIS
This is a script used to add aliases to ones host file automatically

.DESCRIPTION
The way this file works, it will find the path of your host file, 
and append the IP of the site -redirectto when a person goes to the site -site

.EXAMPLE
./addhost.ps1 -site stackoverflow.com -redirectto www.myspace.com

.NOTES
If you experience access issues, try running the following script as administrator.
You may need to run `Set-ExecutionPolicy RemoteSigned` before running any powershell commands.
The site 'redirectto' MUST be accessible via IP address.

.LINK
https://github.com/rguerra712/Pranks

#>

param (
    [string]$site = $(throw "-site is required."),
    [string]$redirectto = $(throw "-redirectto is required.")
 )

$pathHostFile = "$env:windir\system32\drivers\etc\hosts"
$ips = [System.Net.Dns]::GetHostAddresses("$redirectto")
$ip = $ips[0]

Add-Content $pathHostFile "`n`n$ip     $site"