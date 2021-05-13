FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    password { Faker::Internet.password}
  end
end