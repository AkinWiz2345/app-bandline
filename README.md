# BANDLINE

## 概要
バンドメンバー募集サイトです。ユーザ登録後、2種の記事の投稿と他ユーザとのメッセージのやりとりが可能です。versionをbranchを切ることで分けてあります。

## バージョンごとの特徴
* version1(master): 本番環境にHeroku、画像投稿にcarrierwave+cloudinaryを使用。
* version2: 本番環境にAWSのEC2(AmazonLinux)、RDSにMySQL、画像投稿にcarriewave+S3を使用。
* version3: 開発環境にDocker、Docker Composeを導入。コンテナはアプリケーション側とデータベース側(Posgre)の２種。

## 主な機能
* ユーザログイン機能
