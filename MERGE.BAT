@ECHO OFF
REM 結合バッチファイル：div2.exe により生成

ECHO 分割されたファイルを復元します

IF NOT EXIST "MERGET~1.001"  GOTO ERR1
IF NOT EXIST "MERGET~1.002"  GOTO ERR1
IF NOT EXIST "MERGET~1.003"  GOTO ERR1
IF     EXIST "merge.tar.gz"  GOTO ERR2

COPY "MERGET~1.001" "MERGET~1.GZ"
IF ERRORLEVEL 1 GOTO ERR3
COPY /B "MERGET~1.GZ"+"MERGET~1.002"+"MERGET~1.003"
IF ERRORLEVEL 1 GOTO ERR3

DEL "MERGET~1.001"
DEL "MERGET~1.002"
DEL "MERGET~1.003"


REN "MERGET~1.GZ" "merge.tar.gz"

ECHO このバッチファイルも消してください
GOTO END

:ERR1
ECHO ファイルが一部存在しません
ECHO 処理を中止します
GOTO END

:ERR2
ECHO 復元先のファイルが既に存在しています
ECHO 処理を中止します
GOTO END

:ERR3
ECHO 復元に失敗しました
ECHO 処理を中止します
GOTO END

:END
ECHO 終了するには、何かキーを押してください
PAUSE >NUL

