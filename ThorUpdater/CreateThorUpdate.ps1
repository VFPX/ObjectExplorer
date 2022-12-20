# Get the project settings from Project.txt
$appInfo = Get-Content Project.txt
$appName = $appInfo[0].Substring($appInfo[0].IndexOf('=') + 1).Trim()
$appID   = $appInfo[1].Substring($appInfo[1].IndexOf('=') + 1).Trim()
$majorVersion = $appInfo[2].Substring($appInfo[2].IndexOf('=') + 1).Trim()
$exclude = $appInfo[3].Substring($appInfo[3].IndexOf('=') + 1).Trim()
# Ensure no spaces before or after comma
$excludeFiles = $exclude.Split(',')
# Ensure no spaces before or after comma
$exclude = $appInfo[4].Substring($appInfo[4].IndexOf('=') + 1).Trim()
$excludeFolders = $exclude.Split(',')
$versionDATE = $appInfo[5].Substring($appInfo[0].IndexOf('=') + 1).Trim()

$SourceFolder = $pwd
cd '..\Installed Files'

# Get the name of the zip file.
$zipFileName = "..\ThorUpdater\$appID.zip"

 # Delete the zip file if it exists.
    $exists = Test-Path ($zipFileName)
    if ($exists)
    {
        del ($zipFileName)
    }
    
Compress-Archive -Path * -DestinationPath $zipFileName
cd $SourceFolder

# -------------------------------------------------
# JRN 2022-12-11 Create the Version.txt from pieces
$VersionFile = 'VersionTemp.txt'
cat VersionHeader.txt  >  $VersionFile
cat '..\Change Log.md' >> $VersionFile
cat VersionFooter.txt  >> $VersionFile
# -------------------------------------------------

# Read in the update file
$date = Get-Date
$file = $appID + 'Version.txt'
       (Get-Content $VersionFile).
            Replace('versionDATE', $versionDATE).
            Replace('APPNAME', $appName).
            Replace('MAJORVERSION', $majorVersion) |
            Set-Content $file
        Write-Host "Update creation successful"

del ($VersionFile)
