# テーブル設計

## users テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| name        | string  | null: false |
| email       | string  | null: false |
| password    | string  | null: false |

### Association

- has_many :recipe_users
- has_many :recipes, through: :recipe_users

## recipes テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| cuisine     | string | null: false |
| description | text   |             |
| foodstuff   | string | null: false |

### Association

- has_many :recipe_users
- has_many :users, through: :recipe_users

## recipe_users テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| recipe | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :recipe
