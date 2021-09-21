@Echo OFF
:: Run XPEStartup.cmd at Startup Before Explorer Shell 

If /I Not Exist %WinDir%\System32\winpeshl.exe Exit 1

Call :Startup
If "%PROCESSOR_ARCHITECTURE%" == "AMD64" Call :Startup_AMD64
If "%PROCESSOR_ARCHITECTURE%" == "x86" Call :Startup_X86
Exit

:Startup
Echo Startup > %Temp%\Startup.log
For %%I In (C D E F G H I J K L M N O P Q R S T U V W X Y Z A B) Do (
  If /I Exist %%I:CDUsb.y Set UsbDrive=%%I:
)
reg.exe Add "HKCU\Environment" /v UsbDrive /t REG_SZ /f /d "%UsbDrive%"
:: BroadcastEnvChange.exe /broadcast done later from RunOnce
Echo Usb Drive %UsbDrive% >> %Temp%\Startup.log
Goto:Eof

:Startup_AMD64
Echo Startup AMD64 >> %Temp%\Startup.log
Goto:Eof

:Startup_X86
Echo Startup X86 >> %Temp%\Startup.log
Goto:Eof
