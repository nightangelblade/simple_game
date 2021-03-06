def character_select(characters)
	puts "Please select your character"
	sleep(1.5)
	reset_screen
	puts "Fighter Stats:"
	characters[0].each {|stat, value| puts "#{stat}: #{value}"}
	sleep(1.5)
	reset_screen
	puts "Mage Stats:"
	characters[1].each {|stat, value| puts "#{stat}: #{value}"}
	sleep(1.5)
	reset_screen
	puts "Rogue Stats:"
	characters[2].each {|stat, value| puts "#{stat}: #{value}"}
	sleep(1.5)
	reset_screen
	puts "Cleric Stats:"
	characters[3].each {|stat, value| puts "#{stat}: #{value}"}
	sleep(1.5)
	reset_screen
	puts "Jack of All Trades Stats:"
	characters[4].each {|stat, value| puts "#{stat}: #{value}"}
	sleep(1.5)
	reset_screen
	puts "Selection: Fighter, Mage, Rogue, Cleric, Jack"
end

def actions(character, enemy)
	puts "#{character.name} HP: #{character.health} / #{enemy.name} HP: #{enemy.health}"
	puts "Select an action:"
	puts "Attack"
	puts "Magic Attack"
	action = gets.chomp.downcase
	action
end