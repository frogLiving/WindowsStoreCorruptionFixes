net stop wuauserv
net stop cryptSvc
net stop bits
net stop msiserver
del c:\windows\softwaredistribution\*.* /q/s
ren %systemroot%\system32\catroot2 catroot2.bak
net start wuauserv
net start cryptSvc
net start bits
net start msiserver

echo Restarting SCCM agent
net stop CcmExec
net start CcmExec
