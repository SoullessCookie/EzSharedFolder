@echo off
title Ez Shared Folder- Ver. 3.2
Color F0

:menu
cls
echo Ez Shared Folder- Ver. 3.2
echo.
echo -------------------------------------------------
echo Select Method
echo -------------------------------------------------

echo.
echo [1] Custom Settings
echo [2] Default Settings
echo [3] Default Desktop
echo [4] Help
echo.
echo [5] Exit
set /p op=Run:
if %op%==1 goto 1
if %op%==2 goto 2
if %op%==3 goto 3
if %op%==4 goto 4
if %op%==5 goto 5
goto error

:1
cls
set /p FOLDERNAME=Folder Name:
cls
set /p FOLDERPATH=Full Folder Path:
cls
set /p FOLDERUSER=New User Name:
cls
net user /add %FOLDERUSER%
cls
echo New User Permissions-
echo Options: (Pick one)
echo R: Read
echo W: Write
echo C: Change (write)
echo F: Full control
set /p FOLDERPERMS=New User Permissions:
cd \
cd %FOLDERPATH%
mkdir %FOLDERNAME%
CACLS %FOLDERNAME% /p %FOLDERUSER%:%FOLDERPERMS%
echo Information:
echo Folder Name: %FOLDERNAME%
echo Folder Path: %FOLDERPATH%
echo New User Name: %FOLDERUSER%
echo New User Permission: %FOLDERPERMS%
echo.
echo.
echo Press any key to return to the menu. . .
pause >nul
goto menu

:2
cls
cd \
mkdir TestFolder
cd TestFolder
cls
echo This is a sample test file > test.txt
cls
net user /add TestUser
CACLS TestFolder /p TestUser:F
echo cd \
cls
echo mkdir TestFolder
cls
echo Shared folder successfully created
echo.
echo Location: C:/
echo.
echo Name: TestFolder
echo.
echo Permission: Full
echo.
echo Press any key to return to the menu. . .
pause >nul
goto menu

:3
cls
for /f "usebackq tokens=1,2,*" %%B IN (`reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop`) do set DESKTOP=%%D
cd %DESKTOP%
mkdir TestFolder
cd TestFolder
cls
echo This is a sample test file > test.txt
cls
net user /add TestUser
CACLS TestFolder /p TestUser:F
echo cd desktop
cls
echo mkdir TestFolder
cls
echo Shared folder successfully created
echo.
echo Location: %DESKTOP%
echo.
echo Name: TestFolder
echo.
echo Permission: Full
echo.
echo Press any key to return to the menu. . .
pause >nul
goto menu

:4
cls
echo Ez Shared Folder- Ver. 3.2
echo.
echo -------------------------------------------------
echo Help
echo -------------------------------------------------
echo.
echo Custom Settings (Name,Path[Ex. C:\Users\Desktop,New User Name, Permission [R,W,C,F])
echo.
echo Default Folder Path- C:\
echo Default Desktop Path- C:\Users\[userprofile]\Desktop
echo Default User Name- TestUser
echo Default Folder Name- TestFolder
echo.
echo When entering folder path, enter full path (C:\folder\folder)
echo.
echo.
echo Press any key to return to the menu. . .
pause >nul
goto menu

:5
exit
:error
Oopsy doopsy... an error
