REM  ----------------------- Copy TaskManager -----------------------

SET PROJECTNAME=TaskManager
SET TARGET=
SET SOURCE="%~dp0"
SET TARGETSUBDIR=Management
SET ABORTMSG=Abbruch
SET FIN=Projekt wurde erfolgreich kopiert!
SET MSG=Release-Dateien werden kopiert .. 

IF "%TARGET%" == "" (
	SET TARGET=D:\_Anwendungen
)

@echo off


IF "%PROJECTNAME%" == "" GOTO ABORT 
ELSE GOTO COPYFILES

:COPYFILES
echo %MSG%
@echo off

IF EXIST "%SOURCE%\src\%PROJECTNAME%\bin\Release\%PROJECTNAME%.exe" xcopy "%SOURCE%\bin\Release\*.dll" "%TARGET%\%TARGETSUBDIR%\%PROJECTNAME%\" /S /F /R /Y /C
IF EXIST "%SOURCE%\src\%PROJECTNAME%\bin\Release\*.dll" xcopy "%SOURCE%\bin\Release\*.dll" "%TARGET%\%TARGETSUBDIR%\%PROJECTNAME%\" /S /F /R /Y /C
IF EXIST "%SOURCE%\src\%PROJECTNAME%\bin\Release\*.cmd" xcopy "%SOURCE%\bin\Release\*.cmd" "%TARGET%\%TARGETSUBDIR%\%PROJECTNAME%\" /S /F /R /Y /C
IF %ERRORLEVEL% neq 0 goto ProcessError
@echo on
  GOTO FIN

:ABORT
echo %ABORTMSG%

:FIN
echo %FIN%

:ProcessError
@rem process error
exit /b 0

REM pause