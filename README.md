# README

# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| first_name     | string | null: false |
| family_name    | string | null: false |
| first_name_kt  | string | null: false |
| family_name_kt | string | null: false |
| birth_day      | date   | null: false |

### Association

- has_many :items
- has_many :transactions

## items テーブル

| Column       | Type     | Options                        |
| ------------ | -------- | ------------------------------ |
| name         | string   | null: false                    |
| price        | integer  | null: false                    |
| status       | integer  | null: false                    |
| delivery_fee | integer  | null: false                    |
| area         | integer  | null: false                    |
| day          | integer  | null: false                    |
| user_id      |references| null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :transaction

## buyers テーブル

| Column       | Type     | Options                        |
| ------------ | -------- | ------------------------------ |
| prefecture   | string   | null: false                    |
| city         | string   | null: false                    |
| address1     | string   | null: false                    |
| address2     | string   |                                |
| tell         | integer  | null: false                    |

### Association

- belongs_to :transaction

## transactions テーブル

| Column       | Type     | Options                        |
| ------------ | -------- | ------------------------------ |
| user_id      |references| null: false, foreign_key: true |
| item_id      |references| null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :buyer
