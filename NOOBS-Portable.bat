@echo off
:main
cls
echo *********************************************
echo Portable Noobs Installer By Ricky Divjakovski
echo *********************************************
echo 1. New NOOBS-portable project
echo 2. Add OS to NOOBS-portable
echo 3. Format sdcard to FAT format
echo 4. Write NOOBS to sdcard
echo *********************************************
set selection=nul
set /P selection=Make your decision:
if %selection% == 1 goto newnoobs
if %selection% == 2 goto downloados
if %selection% == 3 goto formatsd
if %selection% == 4 goto writetosd

:newnoobs
cls
echo *********************************************
echo Portable Noobs Installer By Ricky Divjakovski
echo *********************************************
echo You are about to remove your current NOOBS
echo portable project, continue? Y/N
echo *********************************************
set /P selection=Make your decision:
if %selection% == n goto Main
if %selection% == N goto Main
cls
echo Deleting old noobsFS
rmdir /S /Q noobs-files
if not exist noobs-files mkdir noobs-files
cd noobs-files
echo Unpacking noobsFS...
"../Tools/7za" x "../Tools/noobsFS.zip">nul
cd ..
cls
echo *********************************************
echo Portable Noobs Installer By Ricky Divjakovski
echo *********************************************
echo                     DONE   
echo *********************************************
pause
goto main

:downloados
cls
echo *********************************************
echo Portable Noobs Installer By Ricky Divjakovski
echo *********************************************
echo select an OS you wish to install.
echo NOTE: some may take longer then others.
echo.
echo 1. OpenELEC for RPi 1
echo 2. OpenELEC for RPi 2
echo 3. OSMC for RPi 1
echo 4. OSMC for RPi 2
echo 5. Arch
echo 6. Pidora
echo 7. Raspbian
echo 8. Risc OS
echo 0. go back to main menu
echo *********************************************
set /P selection=Make your decision:
if %selection% == 1 set input=OpenELEC_Pi1
if %selection% == 2 set input=OpenELEC_Pi2
if %selection% == 3 set input=OSMC_Pi1
if %selection% == 4 set input=OSMC_Pi2
if %selection% == 5 set input=Arch
if %selection% == 6 set input=Pidora
if %selection% == 7 set input=Raspbian
if %selection% == 8 set input=RISC_OS
if %selection% == 0 goto main
for /F "delims=" %%A in ('findstr %input% Tools\oslist.cfg') do set line="%%A"
call Tools/processor
pause
cls
echo *********************************************
echo Portable Noobs Installer By Ricky Divjakovski
echo *********************************************
echo                     DONE   
echo *********************************************
pause
goto downloados

:formatsd
cls
echo *********************************************
echo Portable Noobs Installer By Ricky Divjakovski
echo *********************************************
echo WARNING: make sure you type the right disk
echo          this cannot be undone.
echo.
echo Available disk for formatting
for /f "skip=1 delims=" %%A in ('wmic logicaldisk get caption') do @echo.%%A
echo *********************************************
echo Type your drive letter example D:
set /P volume=Format:
cls
format %volume% /FS:FAT32 /V:NOOBS /Q /X
echo *********************************************
echo Portable Noobs Installer By Ricky Divjakovski
echo *********************************************
echo                     DONE   
echo *********************************************
pause
goto main

:writetosd
cls
echo *********************************************
echo Portable Noobs Installer By Ricky Divjakovski
echo *********************************************
echo Available disk to write to
for /f "skip=1 delims=" %%A in ('wmic logicaldisk get caption') do @echo.%%A
echo *********************************************
echo Type your drive letter example D:
set /P volume=Write to:
cls
cd noobs-files
xcopy . %volume%\ /e
cd ..
cls
echo *********************************************
echo Portable Noobs Installer By Ricky Divjakovski
echo *********************************************
echo                     DONE   
echo *********************************************
pause
goto main