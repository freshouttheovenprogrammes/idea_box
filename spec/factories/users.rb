FactoryBot.define do
  factory :user do
    email "zac@zac.com"
    password "password"
    full_name "Zac Psquizz"
  end
  factory :category do
    name "chores"
  end
end
