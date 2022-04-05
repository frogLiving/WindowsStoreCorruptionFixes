@ECHO OFF

echo Turning off services
net stop bits
net stop wuauserv
net stop cryptsvc

echo Deleting .dat
Del "%ALLUSERSPROFILE%\Application Data\Microsoft\Network\Downloader\qmgr*.dat"

echo Cleaning softwareDistribution
Ren %Systemroot%\SoftwareDistribution\DataStore DataStore.bak
Ren %Systemroot%\SoftwareDistribution\Download Download.bak
Ren %Systemroot%\System32\catroot2 catroot2.bak

echo Resetting bits & updates
sc.exe sdset bits D:(A;CI;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)
sc.exe sdset wuauserv D:(A;;CCLCSWRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)

echo Starting services
net start bits
net start wuauserv   
net start cryptsvc
