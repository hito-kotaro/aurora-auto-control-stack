# aurora-auto-control-stack

## 概要
auroraクラスターをスケジュールで起動/停止させるリソースを作るテンプレート

## 作成されるリソース
- RDSにアクセスするためのIAMロール
- 停止用lambda関数
- 停止用lambda関数のEventBridge
- 開始用lambda関数
- 開始用lambda関数のEventBridge

## 使い方
cron式のスケジュールでauroraを起動/停止します
メンテナンスウィンドウ開始の30分前に起動
終了時刻の30分後に停止といった運用で停止しておくことができます。

### cron式の変更
対象クラスターのメンテナンスウィンドウの時間によって変更してください  
e,g) `cron(30 10 ? * SAT *)` /毎週土曜日 10:30に実行(UTC)

### 対象クラスターへのタグ設定
自動起動/停止の対象にしたいクラスターには以下のタグをつける必要があります。
| key | value |
| ------------- | ------------- |
| autostop | yes |
| autostart  | yas |


### deploy.shについて
実行すると`aurora-control-lambda.yml`を元にスタックが作成されます。
- 変数`STACK_NAME`が作成されるスタック名になります。
- 変数`TEMPLATE_FILE`は、テンプレートファイル(aurora-control-klambda.yml)の名前やパスを変更したら変えてください。
- 実行前に、`$ chmod 755 deploy.yml`を忘れずに。
- 実行前に、`aws cli`の設定が完了していることを確認してください。