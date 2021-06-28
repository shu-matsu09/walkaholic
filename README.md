# アプリケーション名
Walkaholic

# 概要
健康のためにウォーキングを続けたい、ウォーキングをしている人とつながりたい人のためのアプリです。

# URL
https://walkaholic.herokuapp.com/

# テスト用アカウント
e-mail: test@sample
password: 123abc

# 利用方法
まずユーザー登録をします。その後、好きなコミュニティを作るか、既にあるコミュニティに入ってコミュニケーションを取りつつ、日々のウォーキングの成果を入力してグラフやカレンダーで確認できます。

# 目指した課題解決
コロナ渦の現在、運動不足による体調不良やメンタル面の不調、希薄になってしまった人間関係といった問題を解決するために開発しました。若年層から高齢者まで、手軽に取り組めて、健康に効果的なウォーキングを続けられる工夫をしています。
グラフ機能、コミュニティ機能、いいね機能など、ウォーキングを続けたくなる機能を実装予定です。ある研究によると、最も運動を続けられる要因は一緒に運動する友人がいること、ということでした。みんなで一緒にウォーキングをすれば、体調面、メンタル面、人間関係を良好なものにして、健康的な生活を送れるようになります。

# アプリの画像
https://gyazo.com/6c33d35d32151abb988a3cd3860e7c8f

# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false, unique: true |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| target_steps       | integer | null: false               |

### Association

- has_many :pedometers
- has_many :likes
- has_many :communities, through: community_users
- has_many :messages

## pedometers テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| number_of_steps | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| date            | date       | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :likes

## likes テーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| user      | integer | null: false |
| pedometer | integer | null: false |

### Association

  belongs_to :user
  belongs_to :pedometer

## communities テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| detail | text   | null: false |

### Association

- has_many :community_users
- has_many :users, through: community_users
- has_many :messages

## community_users テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| community   | references | null: false, foreign_key: true |

### Association

- belongs_to :community
- belongs_to :user

## messages テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | string     |                                |
| user      | references | null: false, foreign_key: true |
| community | references | null: false, foreign_key: true |

### Association

- belongs_to :community
- belongs_to :user