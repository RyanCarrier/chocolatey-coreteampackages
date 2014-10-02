﻿$saveDir = 'C:\Chocolatey\_work'
if (!(Test-Path $saveDir)) {
  mkdir $saveDir
}

$url = 'http://www.pendrivelinux.com/downloads/YUMI/YUMI-2.0.1.0.exe'
$file = 'yumi.exe'
$filePath = Join-Path $saveDir $file

$webClient = New-Object System.Net.WebClient
$webClient.DownloadFile($url, $filePath)
