# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false, unique: true |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |

### Association

- has_many :pedometers

## pedometers テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| number_of_steps | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| date            | date       | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user