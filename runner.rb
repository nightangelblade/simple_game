require_relative 'character_class'
require_relative 'enemy_class'
require_relative 'die_class'
require_relative 'reset_screen'

die = Die.new

# Player Characters
fighter = {
	health: 100,
	attack: 12,
	magic: 0,
	defense: 10,
	magic_defense: 8,
	agility: 1,
	accuracy: 2
}
mage = {
	health: 100,
	attack: 0,
	magic: 10,
	defense: 4,
	magic_defense: 15,
	agility: 3,
	accuracy: 3
}
rogue = {
	health: 100,
	attack: 20,
	magic: 0,
	defense: 4,
	magic_defense: 0,
	agility: 6,
	accuracy: 5
}
cleric = {
	health: 100,
	attack: 6,
	magic: 6,
	defense: 10,
	magic_defense: 10,
	agility: 0,
	accuracy: 3
}
jack= {
	health: 100,
	attack: 5,
	magic: 5,
	defense: 5,
	magic_defense: 5,
	agility: 5,
	accuracy: 5
}


# Enemy Characters


# UI
reset_screen
puts "Please select your character"
sleep(2)
reset_screen
puts "Fighter Stats:"
fighter.each {|stat, value| puts "#{stat}: #{value}"}
sleep(2)
reset_screen
puts "Mage Stats:"
mage.each {|stat, value| puts "#{stat}: #{value}"}
sleep(2)
reset_screen
puts "Rogue Stats:"
rogue.each {|stat, value| puts "#{stat}: #{value}"}
sleep(2)
reset_screen
puts "Cleric Stats:"
cleric.each {|stat, value| puts "#{stat}: #{value}"}
sleep(2)
reset_screen
puts "Jack of All Trades Stats:"
jack.each {|stat, value| puts "#{stat}: #{value}"}
sleep(2)
reset_screen
character = gets.chomp
if character == "fighter"
	character = fighter
elsif character == "mage"
	character = mage
elsif character == "rogue"
	character = rogue
elsif character == "cleric"
	character = cleric
elsif character == "jack"
	character = jack
end
puts "You have selected #{character}"
player = GameCharacter.new(character)