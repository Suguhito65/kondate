# アプリケーション名

- KonDate

# アプリケーション概要

- レシピ投稿ができるアプリケーションを作成しました。ユーザーを登録するとレシピを投稿でき、自身が投稿したレシピに限り編集と削除ができます。他にも検索窓に食材を一つ入力するとその食材が使われているレシピが一つランダムで表示される検索ガチャ機能やレシピにコメントできるコメント機能があります。

# URL

- http://54.168.154.237/

# テスト用アカウント

## Basic認証のID/Pass

- ID: suguhito
- Pass: 0605

## 投稿者用

- メールアドレス: naoto@naoto.com
- パスワード: suguhito

# 開発環境

- Ruby/Ruby on Rails/MySQL/Github/Visual Studio Code/AWS

# 利用方法

- Basic認証ログイン後にトップページのヘッダーから新規登録もしくはログインをして頂き利用を開始します。
- ヘッダーの＋レシピボタンからレシピが投稿でき、料理名・料理の説明・食材・画像を入力して下さい（料理の説明以外は必須です）。するとトップページに投稿したレシピが表示されます。画像と料理名をクリックして頂くとレシピ詳細ページへ遷移でき、レシピ投稿者のみ編集・削除が可能です。
- 献立ガチャ機能はレシピが幾つか投稿されている事が前提です（あらかじめ投稿してあります）。検索窓に食材を一つ入力するとランダムでその食材に応じたレシピが一つ表示されます（卵料理を幾つか投稿してありますので卵と入力してみて下さい）。
- コメント機能もまたレシピが投稿されている事が前提です。レシピ詳細ページにてレシピへのコメントができます。また、コメントしたユーザーのみコメント削除可能です。

# 目指した課題解決

- 私の妻をはじめ世の中の主婦（主夫）の方々は、献立を考える事が億劫になる日もあるかと思います。勝手に献立を決めてくれるアプリがあると便利だなと思い作りました。その際、冷蔵庫に残った食材を使うことになる事が多いと考え、献立ガチャの検索窓にレシピ名ではなく食材を入れて検索するように設定してみました。

# 実装予定の機能

- いいね機能

# テーブル設計

## users テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| name        | string  | null: false |
| email       | string  | null: false |
| password    | string  | null: false |

### Association

- has_many :recipes
- has_many :comments

## recipes テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| cuisine     | string     | null: false       |
| description | text       |                   |
| foodstuff   | string     | null: false       |
| user        | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| text      | text    | null: false |
| user_id   | integer | null: false |
| recipe_id | integer | null: false |

### Association

- belongs_to :user
- belongs_to :recipes
