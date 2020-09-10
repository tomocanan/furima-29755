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
| birth_day      | integer| null: false |

### Association

- has_many :items
- has_one :buyers

## items テーブル

| Column       | Type     | Options                        |
| ------------ | -------- | ------------------------------ |
| name         | string   | null: false                    |
| image        | string   | null: false                    |
| price        | integer  | null: false                    |
| status       | string   | null: false                    |
| delivery_fee | string   | null: false                    |
| area         | string   | null: false                    |
| day          | string   | null: false                    |
| user         |references| null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :items

## buyers テーブル

| Column       | Type     | Options                        |
| ------------ | -------- | ------------------------------ |
| credit_num   | integer  | null: false                    |
| security_num | integer  | null: false                    |
| date-month   | integer  | null: false                    |
| date-day     | integer  | null: false                    |
| prefecture   | string   | null: false                    |
| city         | string   | null: false                    |
| address1     | string   | null: false                    |
| address2     | string   |                                |
| tell         | integer  | null: false                    |
| user         |references| null: false, foreign_key: true |
| item         |references| null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :items