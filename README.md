# Programmer laptop installation script for FRC 2020 team 4627
What it does: downloads installers, unzips if needed and runs them in the order

Prerequisites: 
* a clean laptop with Windows 10 64 bit
* admin rights

What is included:
* FRC Game Tools 2020
* Phoenix API
* Spark Max
* WPILib
* Git for Windows (aka GitBash)

Before you start:
* Use Ethernet or a faster WiFi 

How to install:
* Start PowerShell with "Run as administrator"
* Run ./FRCWindowsInstall.ps1
* if you get an error saying that your "script cannot be loaded because running scripts is disabled on this system", change your execution policy with Set-ExecutionPolicy -ExecutionPolicy Unrestricted
* Do not restart when FRC Game Tools asks you too. Wait until the end and restart when everything is done
* Do not forget to check "Install VSCode" as part of the WPILib 

What can go wrong with the installation:
* there is a network issue while downloading and the downloaded file is corrupt - delete the corrupt file and restart the script
* the unzip fails half-way (didn’t see this one happening yet, but just in case)- delete the half-unzipped files and restart the script
* the script does not detect that one of the installers has finished (tends to happen with the FRC games tools, but I didn’t figure out the pattern) - stop the script with CTRL-C and start again
* Whenever you start the script, it will only download/unzip the files that have not been downloaded/unzipped yet, but will start the installer even if you ran it before, to give you chance to make changes to an installation without having to uninstall. if you don’t want to make changes, just close the window
