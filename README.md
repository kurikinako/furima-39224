# テーブル設計

## users テーブル

| Column              | Type    | Options                   |
| ------------------  | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| last_name           | string  | null: false               |
| first_name          | string  | null: false               |
| last_name_kana      | string  | null: false               |
| first_name_kana     | string  | null: false               |
| birth_day           | date    | null: false               |

### Association
- has_many :items
- has_many :comments
- has_many :orders


## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | string     | null: false                    |
| version      | text       | null: false                    |
| category_id  | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| postage_id   | integer    | null: false                    |
| sender_id    | integer    | null: false                    |
| ship_date_id | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key:true  |

### Association
- belongs_to :user
- has_many :comments
- has_one :order


## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment      | string     | null: false                    |
| user         | references | null: false, foreign_key:true  |
| item         | references | null: false, foreign_key:true  |

### Association
- belongs_to :user
- belongs_to :item


## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key:true  |
| item             | references | null: false, foreign_key:true  |

### Association
- belongs_to :user 
- belongs_to :item
- has_one :address


## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| sender_id        | integer    | null: false                    |
| city             | string     | null: false                    |
| add_number       | string     | null: false                    |
| building_name    | string     |                                |
| tel_number       | string     | null: false                    |
| order            | references | null: false, foreign_key:true  |

### Association
- belongs_to :order