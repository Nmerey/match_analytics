FactoryBot.define do
  factory :game do
    date { DateTime.now }
    home_team {}
    away_team {}
  end
end
