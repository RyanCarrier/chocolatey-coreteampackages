﻿$packageName = 'owncloud-client'
$fileType = 'exe'
$silentArgs = '/S'
$url = 'https://download.owncloud.com/desktop/stable/ownCloud-1.6.2.3463-setup.exe'

Install-ChocolateyPackage $packageName $fileType $silentArgs $url