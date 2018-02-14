FactoryBot.define do
  factory :user do
    email "zac@zac.com"
    password "password"
    full_name "Zac Psquizz"
    role      0
  end
    factory :admin, class: User do
    first_name "Admin"
    last_name  "User"
    role        1
    id          2
  end
end
