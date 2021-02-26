## usersテーブル

| Column     | Text   | Option      |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |

## Association
- has_one :purchase
- has_one :profile
- has_many :products

## productsテーブル

| column        | Text          | Option      |
| ------------- | ------------- | ----------- |
| product_name  | string        | null: false |
| description   | string        | null: false |
| category      | string        | null: false |
| status        | string        | null: false |
| shopping_cost | int           | null: false |
| shipping_area | string        | null: false |
| shipping_day  | string        | null: false |
| price         | int           | null: false |
| image         | ActiveStorage |             |
| user          | references    |             |

## Association
- belongs_to :user

## profilesテーブル

| column     | Text       | Option      |
| ---------- | ---------- | ----------- |
| first_name | string     | null: false |
| last_name  | string     | null: false |
| furigana   | string     | null: false |
| birthday   | string     | null: false |
| user_id    | references |             |

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