## usersテーブル

| Column             | Text   | Option      |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_furigana     | string | null: false |
| last_furigana      | string | null: false |
| birthday           | string | null: false |

## Association
- has_many :products
- has_one :purchase

## productsテーブル

| column           | Text       | Option      |
| ---------------- | ---------- | ----------- |
| name             | string     | null: false |
| description      | string     | null: false |
| category_id      | integer    | null: false |
| status_id        | integer    | null: false |
| shopping_cost_id | integer    | null: false |
| shipping_area_id | integer    | null: false |
| shipping_day_id  | integer    | null: false |
| price            | integer    | null: false |
| user             | references |             |

## Association
- belongs_to :user

## purchasesテーブル

| column         | Text       | Option      |
| -------------- | ---------- | ----------- |
| credit_number  | string     | null: false |
| postal_code    | string     | null: false |
| phone_number   | string     | null: false |
| prefectures    | string     | null: false |
| municipalities | string     | null: false |
| address        | string     | null: false |
| user_id        | references |             |

## Association
- belongs_to :user