﻿try {

  $packageName = '{{PackageName}}'
  $version = '{{PackageVersion}}'
  $fileType = 'exe'
  $silentArgs = '/S'
  $validExitCodes = @(0)

  $unfile = "${Env:ProgramFiles}\Hedgewars ${version}\Uninstall.exe"
  $unfilex86 = "${Env:ProgramFiles(x86)}\Hedgewars ${version}\Uninstall.exe"

  if (Test-Path "$unfile") {$file = "$unfile"}
  if (Test-Path "$unfilex86") {$file = "$unfilex86"}

  if ((Test-Path "$unfile") -or (Test-Path "$unfilex86")) {
    Uninstall-ChocolateyPackage $packageName $fileType $silentArgs $file -validExitCodes $validExitCodes
  }

  Write-ChocolateySuccess $packageName
} catch {
  Write-ChocolateyFailure $packageName $($_.Exception.Message)
  throw
}
