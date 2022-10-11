
<img width="1434" alt="soccer-app_top" src="https://user-images.githubusercontent.com/66766396/92995364-e9a5f880-f53d-11ea-8f45-0d8b78bd71c1.png">

## 概要

**『 SOCCER APP 』**

サッカーの最新技術を投稿し情報共有ができるサービスです。

## リンク

### **https://soccer-app.com**
ホームページ下部のゲストログインボタンから、テストユーザーとしてログインできます。
現在(2022/10/12　停止しています）

## 制作の背景

地方でサッカーをしてきた中で以下の点を感じ、サッカーが上手くなりたい人向けのサービスを制作したいと考えました。

少子化によりサッカーの練習、試合ができない、指導者数の減少、最新の技術や指導方法を導入している指導者が少ない事からサッカーの技術、経験が都市と地方で拡がっていくと感じました。

そこでこのサービスからサッカーの最新技術等（プロが実施している練習メニュー、プロの思考、戦術など）を共有し、環境に関係なく技術を身に付けれることができたらと思いサービスを制作しました。

## 使用技術

### バックエンド
- Ruby　2.6.5
- Ruby on Rails　5.2.4

### フロントエンド
- HTML
- CSS
- Bootstrap
- JavaScript
- jQuery
- Ajax

### DB
- MySQL

### テスト
- RSpec
- RuboCop

### インフラ・開発環境等

【開発環境】
- Docker
- Docker-Compose

【本番環境】
- AWS(EC2、RDS for MySQL、Route53、ALB、ACM)
- Nginx
- Puma

【その他】

CircleCIを用いてGitHubにpush後に自動テスト、Capistranoにより自動デプロイ

チーム開発を意識したGitHubの活用（イシュー、プルリク、マージ）

- GitHub
- CircleCI
- Capistrano

## インフラ構成図

<img width="703" alt="インフラ構成図" src="https://user-images.githubusercontent.com/66766396/92995952-cdf12100-f542-11ea-8fd7-a312d4fe3833.png">

## 機能一覧

- 記事一覧表示機能
- 記事詳細表示機能
- 記事投稿機能
- いいね機能
- フォロー機能
- 管理ユーザ登録機能
- 管理ユーザログイン機能
- ページネーション機能
- 検索機能
- 投稿のジャンル分け
- YouTube API
- コメント機能
- SNS(twitter,Facebook,LINE）シェア機能
- 簡単ログイン機能
- レスポンシブ対応
- セッション維持機能
- パスワード再設定機能
- 自動リンク機能
