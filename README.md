## 概要

SOCCER APP
サッカーの最新技術を投稿し情報共有ができるサービスです。
転職活動用ポートフォリオとして制作致しました。

## リンク

### **https://soccer-app.com**
ホームページ下部のゲストログインボタンから、テストユーザーとしてログインできます。

## 制作の背景

地方でサッカーをしてきた中で以下の点を感じ、サッカーが上手くなりたい人に向けてのサービスを作ってみたいと考えました。

少子高齢化によりサッカーの練習、試合ができない、指導者数の減少、最新の技術や指導方法を導入している指導者が少ない事からサッカーの技術、経験が都市と地方で拡がっていくと感じました。
そこでこのサービスからサッカーの最新技術（プロが実施している練習メニュー、プロの思考、戦術など）を共有して環境に関係なく技術を身に付けれるようにと考えました。

## 使用技術

### バックエンド
- Ruby　2.6.5
- Ruby on Rails　5.2.4

### フロント
- HTML
- CSS
- bootstrap
- Javascript
- JQuery
- Ajax

### DB
- MySQL

### テスト
- RSpec
- Rubocop

### インフラ・開発環境等
【開発環境】
- Docker
- docker-compose
【本番環境】
- CircleCI
- AWS(EC2、RDS for MySQL、Route53、ALB、 ACM)
- Nginx
- Puma

## インフラ構成図

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
- ランキング機能
- YouTube API
- コメント機能
- SNS(twitter,Facebook,LINE）シェア機能
- 簡単ログイン機能
- レスポンシブ対応
- セッション維持機能
- パスワード再設定機能
- 自動リンク機能
