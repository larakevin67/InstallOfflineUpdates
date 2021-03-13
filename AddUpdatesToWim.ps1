$UpdatesPath = "C:\Utilties\ISOs\Dev\UpdateWim\Win10Prox642004\Updates\*"
$MountPath = "C:\Utilties\ISOs\Dev\TempMount"
$WimFile = "C:\Utilties\ISOs\Dev\UpdateWim\Win10x642004\install.wim"

DISM /Mount-Wim /WimFile:$WimFile /index:1 /Mountdir:$MountPath
$UpdateArray = Get-Item $UpdatesPath
ForEach ($Updates in $UpdateArray)
{
DISM /image:$MountPath /Add-Package /Packagepath:$Updates
Start-Sleep -s 5
}


Write-Host "Updates Applied to $WimFile"
DISM /Unmount-Wim /Mountdir:$MountPath /commit
