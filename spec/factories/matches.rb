FactoryBot.define do
  factory :match do
    date { DateTime.now }
    home_team {}
    away_team {}
  end
end
