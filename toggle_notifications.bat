@echo off
setlocal enabledelayedexpansion

REM 通知のオン/オフの状態を取得
set KEY_NAME=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\PushNotifications
set VALUE_NAME=ToastEnabled
for /f "tokens=3" %%a in ('reg query "%KEY_NAME%" /v "%VALUE_NAME%" ^| findstr /i "%VALUE_NAME%"') do (
    set TOGGLE_FLAG=%%a
)

REM 通知をオン/オフに切り替え
if %TOGGLE_FLAG% EQU 1 (
    reg add "%KEY_NAME%" /v "%VALUE_NAME%" /t REG_DWORD /d 0 /f
    echo 通知をオフにしました。
) else (
    reg add "%KEY_NAME%" /v "%VALUE_NAME%" /t REG_DWORD /d 1 /f
    echo 通知をオンにしました。
)

endlocal
