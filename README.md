## [湯のここち](https://www.yunokokochi.com/)

[![Image from Gyazo](https://i.gyazo.com/b37a9ba46bfee81208c8e792e26d0970.jpg)](https://gyazo.com/b37a9ba46bfee81208c8e792e26d0970)
## アプリの概要

本作品をご覧いただきありがとうございます。
『湯のここち』は私自らがスーパー銭湯をめぐり、その情報を詳しく載せ誰でも気軽に立ち寄れるようなものを目指し作成しました。
他にも投稿欄で温泉好きな方と一緒に楽しく盛り上がるような会話スペースも作成しました。
公式マニュアルや技術記事などを参考に、独学で開発しました。

アプリケーションURL:[湯のここち](https://www.yunokokochi.com/)
## 使用技術

### フロントエンド
* HTML/CSS
* JavaScript
* Vue.js

### バックエンド
* Ruby 2.7.3
* Ruby on Rails 6.1.3.2


### インフラ
* AWS(IAM/VPC/EC2/RDS/S3/Route53/ACM/ALB/ECS/ECR/CLI)
* MySQL 5.7.32
* Nginx
* Unicorn


### 開発環境
* VSCode
* Docker/Docker-compose
* Vagrant
### テスト、静的コード解析
* Rubocop（コード解析ツール）
* RSpec（テスト）
## 湯のここち の開発背景
**本作品の開発経緯は 2 つあります。**<br>
1つ目は私自身がスーパー銭湯が大好きで、スーパー銭湯の施設や料理、日帰りで温泉に入れるという素晴らしさを皆様にも知って頂きたかったのがきっかけです。<br>
「スーパー銭湯ってどういうところだろう？」や「温泉以外楽しむことがない」等皆さんが気になることを、スーパ銭湯や温泉大好きな私自ら皆さんが疑問に思う事を解消し、スーパー銭湯は楽しいところだと知ってほしいことからブログ風紹介サイトを制作しました。<br>

2つ目は現代社会は「ストレス社会」というだけあって皆様日々疲労が溜まっていると思われます。
その疲れた体や気持ちを少しでも安らぐ事が出来ればと思いから今回制作させて頂きました。<br>
温泉地にも行かずとも温かい温泉に浸かり、美味しいものを食べ、優雅な一時を楽しんでからお帰りして頂いてからまた仕事を頑張ってほしいという思いから制作しました。

## 機能一覧/詳細
### ユーザー機能
* 新規登録、ログイン、ログアウト、ユーザー情報編集
* ゲストログイン機能

### サイトに関する機能
* ユーザー同士の共有（投稿一覧、詳細表示、投稿、編集、削除機能）
* コメント機能

### フォロー機能(Ajax)
* フォロー、フォロー解除機能
* フォロー、フォロワー一覧表示機能

### お気に入り機能
* 投稿にお気に入りができる機能
* お気に入りをした投稿のカウントが増減する

### その他機能
* トップページの自動スライドアニメーション(Javascript で実装)
* 温泉施設を閲覧した際のアニメーション(Javascriptで実装)
* ページネーション実装
* ハンバーガーメニュー

## インフラ構築図
[![Image from Gyazo](https://i.gyazo.com/7b6f1e178af7a1084ee0e8dc26192934.png)](https://gyazo.com/7b6f1e178af7a1084ee0e8dc26192934)

## ER図
[![Image from Gyazo](https://i.gyazo.com/d119f2a065a29e55b2ba042abfac5350.png)](https://gyazo.com/d119f2a065a29e55b2ba042abfac5350)
## こだわった点
**シンプルながらにもおしゃれな UI/UX**
誰でも手軽に利用できるように、各スーパー銭湯の紹介・感想欄・ユーザー一覧・ログイン関係のページへの遷移機能を ヘッダーとハンバーガーでできるようにしております。<br>
トップページに JavaScriptを用いた自動スライドアニメーションを使い、各スーパー銭湯紹介にもJavaScriptを使うことにより「魅せる」に力を入れ、感想欄でスーパー銭湯や温泉の話を「楽しむ」ことで皆さんと「繋がる」を意識することができます。
## 今後の改良計画
* Google map APIで地図を見る
* Vue.js によるアプリ部分SPA化

最後まで読んで頂き、誠にありがとうございました！