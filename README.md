<h2 align="center">:sparkles::moneybag::cat:みんなの家計簿:cat::moneybag::sparkles:</h2>
<p align="center">自分と他人の家計簿に興味がある人達に、<br>お金と向き合う場を提供する家計簿公開サービスです。</p>
<br>

![ogp-logo-1](https://user-images.githubusercontent.com/67212652/106421436-0cf72300-64a0-11eb-973f-73e83396485c.png)

## :globe_with_meridians:App URL
### **https://min-kakeibo.work/**  
<p>:star:ユニークユーザー数1,413人</p>
<p>:star:登録者数116人</p>
(2021年2月1日現在）<br>
<br>
<br>

## :green_book:Qiita記事
[家計簿＆資産公開あぷり『みんなの家計簿』をリリースしました](https://qiita.com/riri34566/items/9d37f23da04ab618bd52)
<p>:star:LGTM116</p>
(2021年2月1日現在）<br>
<br>
<br>
<br>

## :fire:プログラミングスクール合同コンテスト『editch』に出場
<p>:star:スポンサー賞・審査員賞受賞</p>

- [editch概要](https://editch.org/)  
- [editch出場動画](https://youtu.be/sBtM49LsjjM?t=1932)

<br>
<br>

## :cat:みんなの家計簿について
### 登場人物
Twitterの投資・資産運用アカウントの人達

### ユーザーが抱える課題
- 自分はお金の遣い方が下手なのでは？と不安になる。資産運用が上手な人の家計簿を参考にしたい。
- ブログやTwitterで家計簿を公開する人達がいるが、情報を集約した場がない。

### 解決方法
自身の代表的な月の家計簿を公開＆他人の家計簿を見られるアプリケーション

### 望む未来
- 他人の家計簿をみることで、自分のお金の遣い方を見直すことができる。
- 自分の家計簿を公開することで、家計簿をつけるモチベーション維持につながる。

### サービスをつくった背景
投資に失敗したことがきっかけで家計簿をつけ始め、家計簿ブログやTwitterを参考に支出を見直して生活するようになった。<br>
お金と向き合うことで、毎月どのくらいの支出であればストレスなく生きていけるのか知ることができ、将来の漠然としていたお金の不安が少なくなったので、前職を辞めて、憧れだったエンジニア転職に挑戦する勇気を持つことができた。<br>

このサービスをきっかけに、お金と向き合って将来への不安を軽減し、好きなことに挑戦できる人が増えていって欲しいと願っている。

### マーケット
20〜40代のTwitter投資・資産運用アカウントの人達
<br>
<br>

## :wrench:使用技術
- Ruby 2.7.2
- Rails 6.0.3
- RSpec
- TailwindCSS

### 主要なGem
- sorcery (認証)
- rails_admin (管理画面)
- cocoon (ネストフォーム部分)
- kaminari (ページネーション)
- meta-tags (メタダグ)
- ransack (検索機能)
- chartkick (グラフ)
- ya_kansuji (日本円表記)
- bullet (N+1検知)
- rspec-rails (テスト)

## :earth_africa:インフラストラクチャー
- CircleCI
- Capistrano
- AWS
  - VPC
  - EC2
    - Amazon Linux 2
  - RDS
  - S3
  - ALB
  - Route53
  - ACM

## ER図
![Sharing_Kakeibo](https://user-images.githubusercontent.com/67212652/106415612-df57ad00-6492-11eb-9fb0-b7c23cc7737f.png)

## インフラ構成図
![インフラ構成図](https://user-images.githubusercontent.com/67212652/106415913-9c4a0980-6493-11eb-9aa8-e94677f436cc.png)
