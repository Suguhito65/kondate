# アプリケーション名

- KonDate

# アプリケーション概要

- レシピ投稿ができるアプリケーションを作成しました。ユーザーを登録するとレシピを投稿でき、自身が投稿したレシピに限り編集と削除ができます。他にも検索窓に食材を一つ入力するとその食材が使われているレシピが一つランダムで表示される検索ガチャ機能があります。

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

- Basic認証ログイン後にトップページのヘッダーから新規登録もしくはログインをして頂き利用を開始します。ヘッダーの＋レシピボタンからレシピが投稿でき、料理名・料理の説明・食材・画像を入力して下さい（料理の説明以外は必須です）。するとトップページに投稿したレシピが表示されます。献立ガチャ機能はレシピが幾つか投稿されている事が前提です（あらかじめ投稿してあります）。検索窓に食材を一つ入力するとランダムでその食材に応じたレシピが一つ表示されます（卵料理を幾つか投稿してありますので卵と入力して下さい）。

# 目指した課題解決

- 私の妻をはじめ世の中の主婦（主夫）の方達は、今日の献立を考える事が億劫になる事があるかと思います。勝手に献立を決めてくれるアプリがあると便利だなと思い作りました。その際、冷蔵庫に残った食材を使うことになる事が多いと考え、献立ガチャの検索窓にレシピ名ではなく食材を入れて検索するように設定してみました。

# 実装予定の機能

- コメント機能
- S3の導入


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
