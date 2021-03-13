$ESDFile = 'C:\install.wim' #Exported wim file
$ISOMediaFolder = 'C:\ISOMedia2' 
$ISOFile = 'C:\ISOWindows10_build2004.iso'
$PathToOscdimg = 'C:\oscdimg'


Write-Output "Checking for oscdimg.exe"
If (Test-Path $PathToOscdimg){
    Write-Output "Oscdimg.exe found, OK, continuing..."
    Write-Output ""
    }
Else {
    Write-Output "Oupps, cannot find Oscdimg.exe. Aborting"
    Break
}

cd "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools"

copype amd64 C:\WinPE_amd64
https://777notes.wordpress.com/2013/10/21/winpe-the-following-processor-architecture-was-not-found-amd64/

Oscdimg -bootdata:2#p0,e,bEtfsboot.com#pEF,e,bEfisys.bin -u1 
-udfver102 C:\winpe_amd64\media C:\winpe_amd64\winpeamd64.iso