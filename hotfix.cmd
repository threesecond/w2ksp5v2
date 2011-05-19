CLS
@ECHO OFF
COLOR 70
MODE CON COLS=70 LINES=20
IF /I "%1" == "" (
    SET NoBackup=/passive /norestart
    SET NoBackup_Comment=^(�N�ƥ��t����^)
) ELSE (
    IF /I "%1" == "/NoBackup" (
        SET NoBackup=/passive /norestart /nobackup
	SET NoBackup_Comment=^(���ƥ��t����^)
           ) ELSE (
              IF /I "%1" == "/?" GOTO help
              IF /I "%1" == "/help" GOTO help
        ECHO �L�Ī��Ѽ� - "%1".
	ECHO.
	GOTO Help
    )
)
ECHO.
ECHO ----------------------------------------------------------------
ECHO   �H�U�N�۰ʦw�˪��n��
ECHO   1. Windows 2000 SP4 ���᪺�Ҧ��ץ���(%NoBackup_Comment%
ECHO   2. Internet Explorer 6 SP1 ���᪺�Ҧ��ץ���%NoBackup_Comment%
ECHO   3. Windows Media Player 9 ���᪺�Ҧ��ץ���%NoBackup_Comment%
ECHO. 
ECHO                                           ��s����G2010/07/03
ECHO ----------------------------------------------------------------
ECHO.
ECHO   1. ���b�w�� Windows 2000 SP4 ���᪺�Ҧ��ץ��ɡA�еy��...
ECHO      �u���b�w�� HotFix Type 1�A�еy��...
FOR %%i in (w2ksp4\hotfix1\Windows2000*.exe) do start /wait %%i %NoBackup%
FOR %%i in (w2ksp4\hotfix1\WindowsMedia*.exe) do start /wait %%i %NoBackup%
start /wait w2ksp4\hotfix1\Windows-KB909520-v1.000-x86-CHT.exe %NoBackup%
start /wait w2ksp4\hotfix1\StepByStepInteractiveTraining-KB923723-x86-CHT.exe %NoBackup%
start /wait w2ksp4\hotfix1\WindowsInstaller-KB893803-v2-x86.exe %NoBackup%
ECHO      �u���b�w�� HotFix Type 2�A�еy��...
FOR %%i in (w2ksp4\hotfix2\*.exe) do start /wait %%i /Q:U /R:N
ECHO      �u���b�w�� HotFix Type 3�A�еy��...
FOR %%i in (w2ksp4\hotfix3\*.exe) do start /wait %%i %NoBackup%
FOR %%i in (w2ksp4\hotfix3\*.msi) do start /wait %%i /passive /norestart
ECHO      �u���b�w�� HotFix Type 4�A�еy��...
FOR %%i in (w2ksp4\hotfix4\*.exe) do start /wait %%i /Q
ECHO      �u���b�w�� Microsoft Update ����A�еy��...
start /wait w2ksp4\hotfix5\WUSETUP.EXE /wuFORce /quiet /norestart
xcopy w2ksp4\hotfix5\muweb.dll %SystemRoot%\System32\ /y > nul
start /wait regsvr32 /s muweb.dll
ECHO      �w�˧����C
ECHO.
ECHO   2. ���b�w�� Internet Explorer 6 SP1 ���᪺�Ҧ��ץ��ɡA�еy��..
ECHO      �u���b�w�� HotFix Type 1�A�еy��...
FOR %%i in (ie6sp1\hotfix1\*.exe) do start /wait %%i %NoBackup%
ECHO      �u���b�w�� HotFix Type 2�A�еy��...
FOR %%i in (ie6sp1\hotfix2\*.exe) do start /wait %%i /Q:U /R:N
ECHO      �u���b�w�� HotFix Type 3�A�еy��...
FOR %%i in (ie6sp1\hotfix3\*.exe) do start /wait %%i %NoBackup%
ECHO      �w�˧����C
ECHO.
ECHO   3. ���b�w�� Windows Media Player 9 ���᪺�Ҧ��ץ��ɡA�еy��...
ECHO      �u���b�w�� HotFix Type 1�A�еy��...
FOR %%i in (wmp9\hotfix1\*.exe) do start /wait %%i %NoBackup%
ECHO      �u���b�w�� HotFix Type 2�A�еy��...
FOR %%i in (wmp9\hotfix2\*.exe) do start /wait %%i /Q:U /R:N
ECHO      �w�˧����C
ECHO.
GOTO End

:Help
ECHO.
ECHO HOTFIX [/NoBackup ^| /Help]
ECHO.
ECHO    hotfix.cmd �i�ΰѼơG
ECHO      �L              �w�˭ץ��ɮɡA�N�ƥ��t���ɮסA�i�Ѳ����ץ��ɡC
ECHO      /NoBackup       �w�˭ץ��ɮɡA���ƥ��t���ɮסA���i�����ץ��ɡC
ECHO      /Help           ��ܥ�������T�C
ECHO.
ECHO.
ECHO    �Ы����N�����������C
PAUSE
GOTO end

:End
EXIT