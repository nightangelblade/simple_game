class GameEnemy
	attr_reader :attack, :magic, :defense, :agility, :accuracy
	attr_accessor :health

	def initialize(stats)
		@health = stats[0]
		@attack = stats[1]
		@magic = stats[2]
		@defense = stats[3]
		@magic_defense = stats[4]
		@agility = stats[5]
		@accuracy = stats[6]
	end


	def attack
		attempt = die.roll + @accuracy - enemy.agility
		strike = 0
		if attempt >= 6
			strike = @attack - enemy.defense
			enemy.health -= strike
		end
	end

	def magic
		cast = @magic - @enemy.magic_defense
		enemy.health -= cast
	end

end