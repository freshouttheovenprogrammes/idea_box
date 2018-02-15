FactoryBot.define do
  factory :user do
    email "zac@zac.com"
    password "password"
    full_name "Zac Psquizz"
    role      0
  end
    factory :admin, class: User do
    email "boss@boss.com"
    password "password"
    full_name "The Boss"
    role        1
    id          2
  end
end
