﻿$packageName = 'Firefox'
$fileType = 'exe'
$version = '25.0.1'
$silentArgs = '-ms'
$language = (Get-Culture).Name # Get language and country code separated by hyphen
#$language = 'xx-XX' # Language override for testing purposes

$urlFile = 'https://www.mozilla.org/en-US/firefox/all/'
$filePath = "$env:TEMP\chocolatey\$packageName"
$fileFullPath = "$filePath\downloadLinks.html"

$uninstallEntry = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Mozilla Firefox ${version}*"
$uninstallEntryx86 = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Mozilla Firefox ${version}*"

try {

    if ((Test-Path $uninstallEntry) -or (Test-Path $uninstallEntryx86)) {
        Write-Host "Firefox $version is already installed."
    } else {

        if (-not (Test-Path $filePath)) {
            New-Item -ItemType directory -Path $filePath
        }

        Get-ChocolateyWebFile $packageName $fileFullPath $urlFile

        # The $out variable contains a value when Firefox supports the user language.
        # Otherwise it will download the en-US installer.

        $out = Select-String -Path $fileFullPath -Pattern "os=win&amp;lang=$language`""
        if ($out -eq $null) {
            $out = Select-String -Path $fileFullPath -Pattern "os=win&amp;lang=$language`""
        }

        if ($out -eq $null) {
            $language = (Get-Culture).TwoLetterISOLanguageName
            $out = Select-String -Path $fileFullPath -Pattern "os=win&amp;lang=$language`""
        }

        if ($out -eq $null) {
            $language = 'en-US' # Fallback language if others fail
        }

        $url = "http://download.mozilla.org/?product=firefox-$version&os=win&lang=$language"

        Install-ChocolateyPackage $packageName $fileType $silentArgs $url

    }

} catch {
  Write-ChocolateyFailure $packageName $($_.Exception.Message)
  throw 
}
