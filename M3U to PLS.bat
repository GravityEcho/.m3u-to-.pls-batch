@echo off 
setlocal enableDelayedExpansion

cd /d "%~dp0"

set "i=0"
@for /f %%a in ('findstr /b "http" playlist.m3u') do (   
    set /a "i+=1"
    set "song[!i!]=%%a" 
)   

set "total=!i!"
>playlist.pls echo [playlist]
>playlist.pls echo NumberOfEntries=!total! 
>playlist.pls (
    for /l %%p in (1,1,!total!) do (
        echo File%%p=!song[%%p]!
    )
)

