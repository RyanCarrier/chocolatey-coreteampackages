﻿$packageName = 'librecad'
$fileType = 'exe'
$silentArgs = '/S'
$version = '2.0.5'
# {\{DownloadUrlx64}\} gets “misused” here as 32-bit download link due to limitations of Ketarin/chocopkgup
$url = 'http://sourceforge.net/projects/librecad/files/Windows/2.0.5/LibreCAD-Installer-2.0.5.exe/download'

Install-ChocolateyPackage $packageName $fileType $silentArgs $url