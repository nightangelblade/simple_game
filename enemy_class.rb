class GameEnemy
	attr_reader :name, :power, :magic, :defense, :magic_defense, :agility, :accuracy
	attr_accessor :health

	def initialize(stats)
		@name = stats[:name]
		@health = stats[:health]
		@power = stats[:attack]
		@magic = stats[:magic]
		@defense = stats[:defense]
		@magic_defense = stats[:magic_defense]
		@agility = stats[:agility]
		@accuracy = stats[:accuracy]
	end


	def attack(die, player)
		attempt = die.roll + @accuracy - player.agility
		strike = 0
		if attempt >= 6
			strike = @attack - player.defense
			if strike <= 0
				strike = 0
			end
			player.health -= strike
		end
	end

	def magic_attack(player)
		cast = @magic - player.magic_defense
		if cast <= 0
			cast = 0
		end
		player.health -= cast
	end

end