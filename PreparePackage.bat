rem This script will make a copy of release compilation and create 7z archive
rem After running this script compile installer through from NSIS_Installer.nsi script
rem in result you will get "portable" .7z archive and installer in Release directory

SET SourcePath=%~dp0SaveGame Backup Tool\bin\Release\
SET DestinationCompilePath=%~dp0Release\Files\
SET DestinationPath=%~dp0Release\

del "%DestinationCompilePath%*.*" /q /f
del "%DestinationPath%*.*" /q /f

xcopy "%SourcePath%*.dll" "%DestinationCompilePath%" /y
xcopy "%SourcePath%*.exe" "%DestinationCompilePath%" /y
xcopy "%~dp0*.md" "%DestinationCompilePath%" /y
xcopy "%~dp0LICENSE" "%DestinationCompilePath%" /y

7z.exe a -mx9 "%DestinationPath%SaveGameBackupTool_Portable.7z" "%DestinationCompilePath%*.exe" "%DestinationCompilePath%*.dll" "%DestinationCompilePath%*.md"

