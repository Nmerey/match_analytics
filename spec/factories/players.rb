FactoryBot.define do
  factory :player do
    name { Faker::Name.name }
    number { rand(1..42) }
    team
  end
end