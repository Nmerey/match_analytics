class Player < ApplicationRecord
	belongs_to :team
	has_many :match_stats
end