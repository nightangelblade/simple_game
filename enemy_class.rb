class GameEnemy
	attr_reader :name, :attack, :magic, :defense, :agility, :accuracy
	attr_accessor :health

	def initialize(stats)
		@name = stats[:name]
		@health = stats[:health]
		@attack = stats[:attack]
		@magic = stats[:magic]
		@defense = stats[:defense]
		@magic_defense = stats[:magic_defense]
		@agility = stats[:agility]
		@accuracy = stats[:accuracy]
	end


	def attack
		attempt = die.roll + @accuracy - player.agility
		strike = 0
		if attempt >= 6
			strike = @attack - player.defense
			player.health -= strike
		end
	end

	def magic
		cast = @magic - @player.magic_defense
		player.health -= cast
	end

end