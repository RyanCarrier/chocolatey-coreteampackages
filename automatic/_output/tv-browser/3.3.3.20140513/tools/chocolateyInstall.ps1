﻿$packageName = 'tv-browser'
$fileType = 'exe'
$silentArgs = '/S'
# {\{DownloadUrlx64}\} gets “misused” here as 32-bit download link due to limitations of Ketarin/chocopkgup
$url = 'http://sourceforge.net/projects/tvbrowser/files/TV-Browser%20Releases%20%28Java%206%20and%20higher%29/3.3.3/tvbrowser_3.3.3_win32.exe/download'

Install-ChocolateyPackage $packageName $fileType $silentArgs $url