rem 日本語:
rem このバッチファイルは、スクリーンセーバーを起動するためのものです。
rem ロック設定が有効でも、設定を自動で変更してロックを無効にします。
rem 実行後は、元の設定に戻ります。

rem English:
rem This batch file is for starting the screen saver.
rem Even if the lock setting is enabled, the setting is automatically changed to disable the lock.
rem After execution, the setting will return to its original state.


@echo off

:: 現在のロック設定を保存する
for /f "tokens=3" %%i in ('reg query "HKEY_CURRENT_USER\Control Panel\Desktop" /v ScreenSaverIsSecure ^| findstr ScreenSaverIsSecure') do set "lock_setting=%%i"

:: ロックを無効にするレジストリエントリの値を設定する
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v ScreenSaverIsSecure /t REG_SZ /d 0 /f

:: スクリーンセーバーを起動する
start /wait scrnsave.scr /S

:: ロック設定を元に戻す
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v ScreenSaverIsSecure /t REG_SZ /d %lock_setting% /f
