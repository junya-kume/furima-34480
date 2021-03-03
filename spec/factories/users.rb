FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'10000a'}
    password_confirmation {password}
    first_name            {'苗字'}
    last_name             {'名前'}
    first_furigana        {'ミョウジ'}
    last_furigana         {'ナマエ'}
    birthday              {'1930-01-01'}
  end
end