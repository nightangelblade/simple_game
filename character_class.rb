class GameCharacter
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


	def attack(die ,enemy)
		attempt = die.roll + @accuracy - enemy.agility
		strike = 0
		if attempt >= 6
			strike = @power - enemy.defense
			enemy.health -= strike
		end
	end

	def magic_attack(enemy)
		cast = @magic - enemy.magic_defense
		enemy.health -= cast
	end

end