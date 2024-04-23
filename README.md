![ケーキ販売のECサイトです。](https://github.com/Kerberos3team/NaganoCake_A/assets/158814441/b464a159-c7fa-416e-8385-c6b391af5f22)
## アプリケーション
アプリケーション名：NaganoCakeA  
アプリケーション概要：長野県にある洋菓子店「ながのCAKE」の商品を通販するためのECサイトです。  
※DWCチーム開発フェーズの制作物アプリケーションです。

## サービスのURL
※＜URL>  
ログインせずに閲覧できる機能も実装しておりますので、お気軽にお試しください。

## サービスへの想い
元々近隣住民がお客様がメインでしたが、昨年始めたInstagramからご好評を賜り、全国から注文のお問い合わせをいただくようになりました。  
InstagramのDMやメールで通販の注文を受けておりましたが、情報管理が煩雑になってきており、皆様にもご迷惑をおかけする可能性が出てきたため、
管理機能を含んだ通販サイトを開設させていただくこととなりました。  
お子様からお年寄りの方までお召し上がりいただけるよう、様々なバリエーションをご用意しております。  
また、全国へ発送可能ですので、「いつ」でも「どこ」でもご注文いただけます。ぜひご注文ください。  

## 通販について
- 通販では注文に応じて制作する受注生産型としています。
- 現在通販での注文量は十分に対応可能な量のため、1日の受注量に制限は設けていません。
- 送料は１配送につき全国一律800円です。
- 友人や家族へのプレゼントなど、注文者の住所以外にも商品を発送できます。
- 支払い方法はクレジットカード、銀行振込から選択できます。

## 動作や機能がわかるような画像や動画
＜完成したら添付＞

## 使用技術
[![My Skills](https://skillicons.dev/icons?i=html,css,bootstrap,ruby,rails,js,aws,git,github)](https://skillicons.dev)


## Gem
```
gem 'devise'
gem 'kaminari','~> 1.2.1'
gem "enum_help"
```

## ER図
<img width="883" alt="ER図" src="https://github.com/Kerberos3team/NaganoCake_A/assets/158814441/9ecc9741-996e-4943-9157-1b65e4e02ab8">

## 画面遷移図
#### 顧客
<img width="1463" alt="スクリーンショット 2024-04-23 21 08 51" src="https://github.com/Kerberos3team/NaganoCake_A/assets/158814441/a1eff255-5929-4bb9-be6d-a2288fdc96f7">

#### 管理者
<img width="1452" alt="スクリーンショット 2024-04-23 21 08 30" src="https://github.com/Kerberos3team/NaganoCake_A/assets/158814441/6627cb24-6985-4a71-a6f2-77005825610f">

## 実装した機能
#### 　顧客
|機能名|説明|非ログイン時利用可否|
|----|------|------|
|ログイン機能|・メールアドレス、パスワードでログインできる。<br>・ログイン時のみ利用できる機能が利用できるようになる。 |◯|
|ログアウト機能|・ログインしている状態からログアウト状態にする。<br>・ログイン時のみ利用できる機能が利用できなくなる。 |×|
|商品一覧表示機能|・商品を一覧表示する。<br>・検索結果を表示する場合は、検索条件に当てはまる商品のみ一覧表示する。|◯|
|商品詳細表示機能|・商品一覧画面で選択した商品の詳細情報を表示する。<br>・カート追加機能が表示されている。 |◯|
|カート追加機能|・カートに商品を追加することができる。 |×|
|カート一覧機能|・カートの中身を一覧表示することができる。 |×|
|カート編集機能|・カートの中身の個数を編集したり、削除したりすることができる。|×|
|注文機能|・カートの中身の購入をすることができる。<br>・支払方法や発送先を設定することができる。|×|
|会員情報編集機能|・登録している情報を編集することができる。|×|
|退会機能|・退会手続きをすることができる。|×|
|配送先追加・編集機能|・登録している配送先を一覧で確認することができる。<br>・配送先の新規追加・修正・削除をすることができる。|×|
|注文履歴一覧表示機能|・過去の注文概要を一覧で確認することができる。 |×|
|注文履歴詳細表示機能|・注文の詳細（注文商品や個数など）を確認することができる|×|

#### 　管理者
|機能名|説明|非ログイン時利用可否|
|----|------|------|
|ログイン機能|・メールアドレス、パスワードでログインできる。<br>・ログイン時のみ利用できる機能が利用できるようになる。|◯|
|ログアウト機能|・ログインしている状態からログアウト状態にする。<br>・ログイン時のみ利用できる機能が利用できなくなる。|×|
|注文履歴一覧表示機能|・過去の注文概要を一覧で確認することができる。|×|
|注文履歴詳細情報表示機能|・注文の詳細（注文商品や個数など）を確認することができる。<br>・注文ステータス、製作ステータスを変更することができる。 |×|
|顧客一覧表示機能|・顧客情報を一覧で確認することができる。<br>・検索結果を表示する場合は、検索条件に当てはまる顧客のみ一覧表示する。 |×|
|顧客詳細情報表示機能|・顧客の詳細情報を確認することができる。<br>・顧客のステータス（有効/退会）を切り替えることができる。 |×|
|商品一覧表示機能|・登録商品を一覧で確認することができる。<br>・検索結果を表示する場合は、検索条件に当てはまる商品のみ一覧表示する。|×|
|商品詳細情報表示機能|・商品の詳細情報を確認することができる。|×|
|商品情報変更機能|・商品の登録情報を変更することができる。<br>・販売ステータスを変更することができる。 |×|
|ジャンル設定機能|・ジャンルの追加・変更を行うことができる。 |×|
|検索機能|商品名・会員氏名で検索ができ、検索条件に当てはまる情報を一覧表示する|×|

## 使用方法
#### インストール方法
```
$ git clone 
$ cd NaganoCake_A
$ bundle install
$ rails db:migrate
$ rails db:seed
```

#### テスト方法
【管理者アカウント】  

URLをadmin/sign_upに変更し、下記情報でログインしてください。  
メールアドレス：admin@admin  
パスワード：password  

【顧客用アカウント】  

新規登録でアカウントを作成してください。

#### デプロイ方法の記載
（仮）

## 作者
DWCチーム開発Aグループ（ケルベロスさんチーム）
