# BANDLINE

## 概要
バンドメンバー募集サイトです。ユーザ登録後、2種の記事の投稿や他ユーザとメッセージのやりとりが可能です。  
Heroku版 https://bandline.herokuapp.com/  
AWS版　http://bandline-aws.com./

## 使用言語、フレームワーク
Ruby 2.5.3  
Rails 5.2.2

## バージョン
branchを切ることでバージョンを分けてあります。それぞれの特徴は以下の通りです。
* version1(masterブランチ): 本番環境にHerokuを使用。テスト環境にRspecを導入(随時追記中)。
* version2: 本番環境をAWS化。EC2のOSはLinux、WebサーバにNginx、APサーバにUnicorn、RDSにMySQLを使用。
* version3: 開発環境にDocker、Docker Composeを導入。コンテナはAP側と DB側(PosgresSQL)の2つ。

## 主な機能
* ユーザ登録機能
* ユーザログイン機能
* ユーザ一覧機能
* ユーザ詳細表示機能
* 記事投稿機能(1ユーザにつき募集側と加入希望側の2種をそれぞれ1つずつまで投稿可能)
* 記事一覧表示機能
* 記事詳細表示機能
* お気に入り登録機能
* お気に入り一覧機能(気になるリスト)
* メッセージ送信機能(他ユーザと同ルームでメッセージのやりとりが可能)
* メッセージ一覧機能
* 画像アップロード機能(carriewave)
* ページネーション機能
* 単体テスト機能(随時追記中)
* 統合テスト機能(随時追記中)

## 補足
### version1(masterブランチ)
画像投稿はcarrierwaveとcloudinaryで実行。機能の追加は基本こちらで実施。
### version2
画像投稿はcarrierwaveとS3で実行。アドレスは独自ドメイン取得後に紐付けで実現。
### version3
将来的にはWebサーバ、APサーバ、DBサーバの3つのコンテナでの実装を検討。
