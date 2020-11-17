# テーブル設計

## users テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| name        | string  | null: false |
| email       | string  | null: false |
| password    | string  | null: false |

### Association

- has_many :recipes

## recipes テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| cuisine     | string     | null: false       |
| description | text       |                   |
| foodstuff   | string     | null: false       |
| user        | references | foreign_key: true |

### Association

- belongs_to :user
