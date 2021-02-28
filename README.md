## usersテーブル

| Column             | Text   | Option       |
| ------------------ | ------ | ------------ |
| nickname           | string | null: false  |
| email              | string | unique: true |
| encrypted_password | string | null: false  |
| first_name         | string | null: false  |
| last_name          | string | null: false  |
| first_furigana     | string | null: false  |
| last_furigana      | string | null: false  |
| birthday           | date   | null: false  |

## Association
- has_many :products
- has_many :purchase
- belongs_to :user_products

## productsテーブル

| column           | Text       | Option            |
| ---------------- | ---------- | ----------------- |
| name             | string     | null: false       |
| description      | text       | null: false       |
| category_id      | integer    | null: false       |
| status_id        | integer    | null: false       |
| shopping_cost_id | integer    | null: false       |
| shipping_area_id | integer    | null: false       |
| shipping_day_id  | integer    | null: false       |
| price            | integer    | null: false       |
| user             | references | foreign_key: true |

## Association
- belongs_to :user
- belongs_to :user_products

## purchasesテーブル

| column           | Text       | Option            |
| ---------------- | ---------- | ----------------- |
| postal_code      | string     | null: false       |
| phone_number     | string     | null: false       |
| shipping_area_id | string     | null: false       |
| municipalities   | string     | null: false       |
| address          | string     | null: false       |
| building_number  | string     |                   |
| user             | references | foreign_key: true |

## Association
- belongs_to :user

## user_productsテーブル
| Column     | Text       | Option                         |
| ---------- | ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| product_id | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :product