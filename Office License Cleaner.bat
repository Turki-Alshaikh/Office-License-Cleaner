@echo off
setlocal EnableDelayedExpansion
title Office License Cleaner

:: =====================================================================
:: Project:  Office License Cleaner
:: Author: Turki Alshaikh
:: GitHub: https://github.com/Turki-Alshaikh
:: Website: https://mfatihy.com
:: Description: A smart automated tool to clean old/pending Office 
::              license tokens without breaking active activations.
:: =====================================================================

:: 1. Auto-Elevate to Administrator (UAC Bypass Prompt)
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /b
)

:: 2. Set Current Directory to Script Location
cd /d "%~dp0"

:: 3. Find Office Path
set "OSPP="
if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" set "OSPP=%ProgramFiles%\Microsoft Office\Office16\ospp.vbs"
if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" set "OSPP=%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs"

if not defined OSPP (
    echo MsgBox "Microsoft Office was not found on this PC.", vbCritical, " Error" > "%temp%\err.vbs"
    cscript //nologo "%temp%\err.vbs"
    del "%temp%\err.vbs"
    exit /b
)

:: 4. Ask User for Cleaning Mode via GUI
echo Dim ans > "%temp%\ask.vbs"
echo ans = MsgBox("Choose Cleaning Mode:" ^& vbCrLf ^& vbCrLf ^& "[ YES ] - SMART CLEAN: Keep active licenses, remove only expired/pending ones." ^& vbCrLf ^& "[ NO ] - DEEP CLEAN: Remove ALL Office licenses from this PC.", vbYesNo+vbQuestion, " License Cleaner") >> "%temp%\ask.vbs"
echo WScript.Quit(ans) >> "%temp%\ask.vbs"

cscript //nologo "%temp%\ask.vbs"
set "CHOICE=%errorlevel%"
del "%temp%\ask.vbs"

cls
echo ==========================================
echo    Mfatihy.com - Cleaning in progress...
echo ==========================================
echo.

set "LIC="
set "DELETED_KEYS="
set "KEPT_KEYS="

:: 5. Process and Track Licenses Silently
for /f "tokens=1,* delims=:" %%a in ('cscript //nologo "!OSPP!" /dstatus') do (
    set "KEY=%%a"
    set "VAL=%%b"

    if "!KEY!"=="LICENSE STATUS" set "LIC=!VAL!"

    if "!KEY!"=="Last 5 characters of installed product key" (
        set "PROD=!VAL: =!"
        
        if "!CHOICE!"=="7" (
            echo [-] Removing Key: !PROD!
            cscript //nologo "!OSPP!" /unpkey:!PROD! >nul
            set "DELETED_KEYS=!DELETED_KEYS! [!PROD!]"
        ) else (
            echo !LIC! | findstr /C:"---LICENSED---" >nul
            if !errorlevel! equ 0 (
                echo [+] Kept Active Key: !PROD!
                set "KEPT_KEYS=!KEPT_KEYS! [!PROD!]"
            ) else (
                echo [-] Removing Old Key: !PROD!
                cscript //nologo "!OSPP!" /unpkey:!PROD! >nul
                set "DELETED_KEYS=!DELETED_KEYS! [!PROD!]"
            )
        )
        set "LIC="
    )
)

:: 6. Format Variables for Final Report
if "!DELETED_KEYS!"=="" set "DELETED_KEYS= None"
if "!KEPT_KEYS!"=="" set "KEPT_KEYS= None"

:: 7. Show Final Report Message
echo MsgBox "Cleaning Completed Successfully!" ^& vbCrLf ^& vbCrLf ^& "Deleted Keys:!DELETED_KEYS!" ^& vbCrLf ^& "Kept Active Keys:!KEPT_KEYS!", vbInformation, "Mfatihy - Done" > "%temp%\done.vbs"
cscript //nologo "%temp%\done.vbs"
del "%temp%\done.vbs"