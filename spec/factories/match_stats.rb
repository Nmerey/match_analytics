FactoryBot.define do
  factory :match_stat do
    match { nil }
    player { nil }
    shot_on_target { 1 }
    shot_misses { 1 }
    distance_covered { 1 }
    passes { 1 }
    pass_acc { 1 }
  end
end
