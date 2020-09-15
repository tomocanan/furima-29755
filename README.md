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
| birthday       | date   | null: false |

### Association

- has_many :items
- has_many :item_transactions

## items テーブル

| Column       | Type     | Options                        |
| ------------ | -------- | ------------------------------ |
| name         | string   | null: false                    |
| info         | text     | null: false                    |
| price        | integer  | null: false                    |
| status       | integer  | null: false                    |
| delivery_fee | integer  | null: false                    |
| prefecture   | integer  | null: false                    |
| day          | integer  | null: false                    |
| user         |references| null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item_transaction

## buyers テーブル

| Column       | Type     | Options                        |
| ------------ | -------- | ------------------------------ |
| postal       | string   | null: false                    |
| prefecture   | integer  | null: false                    |
| city         | string   | null: false                    |
| address1     | string   | null: false                    |
| address2     | string   |                                |
| tell         | string   | null: false                    |

### Association

- belongs_to :item_transaction

## item_transactions テーブル

| Column       | Type     | Options                        |
| ------------ | -------- | ------------------------------ |
| user         |references| null: false, foreign_key: true |
| item         |references| null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :buyer
