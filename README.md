# BANDLINE

## 概要
バンドメンバー募集サイトです。ユーザ登録後、2種の記事の投稿や他ユーザとメッセージのやりとりが可能です。

## 使用言語、フレームワーク
Ruby 2.5.3
Rails 5.2.2

## バージョン
branchを切ることでバージョンを分けてあります。それぞれの特徴は以下の通りです。
* master(version1とする): 本番環境にHerokuを使用。
* version2: 本番環境をAWS化。EC2のOSはLinux、WebサーバにNginx、APサーバにUnicorn、RDSにMySQLを使用。
* version3: 開発環境にDocker、Docker Composeを導入。コンテナはアプリケーション側と データベース側の2つ。
