FactoryBot.define do
  factory :appointment do
    date { Date.today }
    branch { Faker::Name.name }
  end
end