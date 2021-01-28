FactoryBot.define do
  factory :game_stat do
    game 
    player
    shot_on_target { rand(0..10) }
    shot_misses { rand(5) }
    distance_covered { rand(1..15) }
    passes { rand(10..100) }
    pass_completed { rand(1..99) }
  end
end
