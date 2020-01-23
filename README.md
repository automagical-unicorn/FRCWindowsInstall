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

Before you start:
* Use Ethernet or a faster WiFi 

How to install:
* Start PowerShell with "Run as administrator"
* Run ./FRCWindowsInstall.ps1
* if you get an error saying that your "script cannot be loaded because runnin scripts is disabled on this system", change your execution policy with Set-Execution-Policy -ExecutionPolicy Unrestricted
