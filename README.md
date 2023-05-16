# テーブル設計

## users テーブル

| Column              | Type    | Options     |
| ------------------  | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| encrypted_password  | string  | null: false |
| last_name           | string  | null: false |
| first_name          | string  | null: false |
| last_name_kana      | string  | null: false |
| first_name_kana     | string  | null: false |
| birth_day_yy        | integer | null: false |
| birth_day_mm        | integer | null: false |
| birth_day_dd        | integer | null: false |

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | string     | null: false                    |
| version      | text       | null: false                    |
| category     | string     | null: false                    |
| condition    | string     | null: false                    |
| postage      | integer    | null: false                    |
| sender       | string     | null: false                    |
| ship_date    | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key:true  |

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment      | string     | null: false                    |
| user         | references | null: false, foreign_key:true  |
| item         | references | null: false, foreign_key:true  |

## credit_cards テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_number      | integer    | null: false                    |
| expiration_date  | integer    | null: false                    |
| security_code    | integer    | null: false                    |
| user             | references | null: false, foreign_key:true  |

## address テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| sipping_address  | string     | null: false                    |
| post_code        | integer    | null: false                    |
| prefectures      | string     | null: false                    |
| city             | string     | null: false                    |
| add_number       | integer    | null: false                    |
| building_name    | string     | null: false                    |
| tel_number       | integer    | null: false                    |
| user             | references | null: false, foreign_key:true  |
