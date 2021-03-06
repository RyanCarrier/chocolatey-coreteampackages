﻿$packageName = 'gimp'
$version = '2.8.14'
$url = 'http://gimper.net/downloads/pub/gimp/stable/windows/gimp-2.8.14-setup.exe'
$installerType = 'exe'
$installArgs = 'SP- /SILENT /NORESTART'
$gimpRegistryPath = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\GIMP-2_is1'


try {

  if (Test-Path $gimpRegistryPath) {
    $installedVersion = (Get-ItemProperty -Path $gimpRegistryPath -Name 'DisplayVersion').DisplayVersion
  }

  if ($installedVersion -eq $version) {
    Write-Output "GIMP $installedVersion is already installed. Skipping download and installation."
  } else {
    Install-ChocolateyPackage $packageName $installerType $installArgs $url -validExitCodes @(0)
  }
} catch {
  Write-ChocolateyFailure $packageName $($_.Exception.Message)
  throw
}
