FOR /f "tokens=1 delims= " %%A in (%line%) do set type=%%A
if not %type% == Os_Input- goto end
FOR /f "tokens=2 delims= " %%A in (%line%) do set name=%%A
if not exist noobs-files mkdir noobs-files
cd noobs-files
if not exist os mkdir os
cd os
if not exist %name% mkdir %name%
cd %name%
FOR /f "tokens=3* delims= " %%A in (%line%) do (
echo Downloading packages for %name%...
"../../../Tools/wget" -Nq %%A
"../../../Tools/wget" -Nq %%B
"../../../Tools/wget" -Nq %%C
"../../../Tools/wget" -Nq %%D
"../../../Tools/wget" -Nq %%E
"../../../Tools/wget" -Nq %%F
"../../../Tools/wget" -Nq %%G
"../../../Tools/wget" -Nq %%H
"../../../Tools/wget" -Nq %%I
"../../../Tools/wget" -Nq %%J
)
echo Extracting files for %name%
"../../../Tools/7za" x "marketing.tar" slides_vga>nul
cd ..
cd ..
cd ..

:end