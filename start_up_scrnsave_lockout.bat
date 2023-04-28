rem 日本語:
rem このバッチファイルは、スクリーンセーバーを起動して画面をロックするためのものです。
rem ロック設定が無効でも、設定を自動で変更してロックを有効にします。
rem 実行後は、元の設定に戻ります。

rem English:
rem This batch file is for starting the screen saver and locking the screen.
rem Even if the lock setting is disabled, the setting is automatically changed to enable the lock.
rem After execution, the setting will return to the original setting.

@echo off

:: 現在のロック設定を保存する
for /f "tokens=3" %%i in ('reg query "HKEY_CURRENT_USER\Control Panel\Desktop" /v ScreenSaverIsSecure ^| findstr ScreenSaverIsSecure') do set "lock_setting=%%i"

:: ロックを有効にするレジストリエントリの値を設定する
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v ScreenSaverIsSecure /t REG_SZ /d 1 /f

:: スクリーンセーバーを起動して画面をロックする
start /wait scrnsave.scr /s
rundll32.exe user32.dll, LockWorkStation

:: ロック設定を元に戻す
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v ScreenSaverIsSecure /t REG_SZ /d %lock_setting% /f

