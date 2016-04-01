<#

.SYNOPSIS
This is a script randomly play a song for a given duration

.DESCRIPTION
The way this file works, queries the Clyp API, chooses a random song, then plays it

.EXAMPLE
./annoyingclyp.ps1 -duration 10000

.NOTES
The duration is in milliseconds

.LINK
https://github.com/rguerra712/Pranks

#>

param (
    [int]$duration
 )


$randomSongs = (Invoke-webrequest -URI "https://api.clyp.it/featuredlist/random").Content | ConvertFrom-Json

$randomSong = $randomSongs[0]

$filename = $randomSong.Mp3Url

Write-Output "Playing song $filename"
Add-Type -AssemblyName PresentationCore 
$mediaPlayer = New-Object System.Windows.Media.MediaPlayer 
$mediaPlayer.Open($filename)
$mediaPlayer.Volume = 1
$MediaPlayer.Play()

if ($duration -ne 0)
{
    Start-Sleep -Milliseconds $duration
    $mediaPlayer.Stop()
    $mediaPlayer.Close()
}

$mediaPlayer.Close()