# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

first_team = Team.create(name: Faker::Team.name)
second_team = Team.create(name: Faker::Team.name)
10.times { Player.create(name: Faker::Name.name, team: first_team ) }
10.times { Player.create(name: Faker::Name.name, team: second_team ) }

5.times { Game.create(home_team: first_team, away_team: second_team, date: DateTime.now) }
games = Game.last(5)

for game in games do 
	for player in game.players do
		GameStat.create(game: game, player: player, shot_on_target: rand(0..10), shot_misses:rand(5),distance_covered: rand(5..15),passes: rand(10..100), pass_completed: rand(0..99))
	end
end