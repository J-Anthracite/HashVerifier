@echo off
title Hash Verifier

SetLocal EnableDelayedExpansion

cls
echo /// Welcome To Hash Verifier ///

IF [%1]==[] GOTO File

IF exist %1 (
	set filepath=%1
    for %%A in ("!filepath!") do set filename=%%~nxA
    GOTO Start
) ELSE (
	GOTO File
)

:File
echo.
echo What is the the file you want to Verify?
set /p filepath="Filepath: "

if not exist !filepath! (
    echo Invalid Filepath!
    GOTO File
) ELSE (
    for %%A in ("!filepath!") do set filename=%%~nxA
    GOTO Start
)

GOTO Start

:StartHash
cls
echo /// Hash Verifier ///
echo.
echo Hashing !filename! With !algo!
echo.
echo Please Wait...
for /f "skip=1 delims=" %%A in ('certUtil -hashfile "!filepath!" "!algo!"') do (
    set hash=%%A
    goto :FinishHash
)

:FinishHash
cls
echo /// Hash Verifier ///
echo.
echo Hash Complete!
echo.
echo File: !filename!
echo Algorithm: !algo!
echo Hash: !hash!
echo.
echo Specify Hash to Compare
set /p comparehash=Hash: 

echo.
if %comparehash%==!hash! ( 
    Echo Hash Is a Match!
) else (
    Echo Hash Doesn't Match!
)

GOTO End


:Start
cls
echo /// Hash Verifier ///
echo.
Echo Hash Target: !filepath!
echo.
echo 1. MD2
echo 2. MD4
echo 3. MD5
echo 4. SHA1
echo 5. SHA256
echo 6. SHA384
echo 7. SHA512

set algo=-1
set /p input=Select Hash Algorithm (1-7): 

if !input!==1 set algo=MD2
if !input!==2 set algo=MD4
if !input!==3 set algo=MD5
if !input!==4 set algo=SHA1
if !input!==5 set algo=SHA256
if !input!==6 set algo=SHA384
if !input!==7 set algo=SHA512

if NOT !algo!==-1 GOTO :StartHash

echo.
echo Invalid Selection!
echo.
echo.
GOTO Start

:End
echo.
endlocal
pause