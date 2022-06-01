# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| first_name_kana    | string | null: false              |
| last_name_kana     | string | null: false              |
| birth_date         | date   | null: false              |


### Association

- has_many :products
- has_many :buys

## products テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| product_name         | string     | null: false                    |
| explanation          | text       | null: false                    |
| price                | integer    | null: false                    |
| category_id          | integer    | null: false                    |
| product_condition_id | integer    | null: false                    |
| delivery_charge_id   | integer    | null: false                    |
| area_id              | integer    | null: false                    |
| send_day_id          | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |
| image_id             | text       | null: false                    |

### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :address

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |
| buy              | references | null: false, foreign_key: true |

### Association

- belongs_to :buy



カラムを追加したい時
1、rails g migration AddNicknameToUsers nickname:stringをしてmigrate
2、rails db:rollback を行いマイグレーションファイルを修正
（3、マイグレーションファイルの修正を行い、rails db:migrate:reset）

3のデメリット
・データが全て消える為、本番環境でできない

rails db:migrate:reset は以下の3つを行うコマンド
1、rails db:drop
2、rails db:create
3、rails db:migrate


●名称はなんでもOKですが、統一させることが大切です
テーブル名に合わせて名前を統一させることがおすすめです
productに合わせる
1、modelの書き替えたところを元にもどす
2、furimasコントローラーを削除してproductsコントローラーの作成
3、ビューitemフォルダの名称を、productsに変更