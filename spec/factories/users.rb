FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '田中' }
    first_name            { '次郎' }
    last_name_kana        { 'タナカ' }
    first_name_kana       { 'ジロウ' }
    birth_day             { Faker::Date.birthday(min_age: 5, max_age: 93) }
  end
end
