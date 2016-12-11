require_relative 'character_class'
require_relative 'enemy_class'
require_relative 'die_class'
require_relative 'reset_screen'
require_relative 'interfaces'

die = Die.new

# Player Characters
fighter = {
	name: "Fighter",
	health: 100,
	attack: 12,
	magic: 0,
	defense: 10,
	magic_defense: 8,
	agility: 1,
	accuracy: 2
}
mage = {
	name: "Mage",
	health: 100,
	attack: 0,
	magic: 10,
	defense: 4,
	magic_defense: 15,
	agility: 3,
	accuracy: 3
}
rogue = {
	name: "Rogue",
	health: 100,
	attack: 20,
	magic: 0,
	defense: 4,
	magic_defense: 0,
	agility: 6,
	accuracy: 5
}
cleric = {
	name: "Cleric",
	health: 100,
	attack: 6,
	magic: 6,
	defense: 10,
	magic_defense: 10,
	agility: 0,
	accuracy: 3
}
jack= {
	name: "Jack of All Trades",
	health: 100,
	attack: 5,
	magic: 5,
	defense: 5,
	magic_defense: 5,
	agility: 5,
	accuracy: 5
}
player_characters = [fighter, mage, rogue, cleric, jack]

# Enemy Characters
slime = {
	name: "Slime",
	health: 10,
	attack: 2,
	magic: 0,
	defense: 2,
	magic_defense: 2,
	agility: 0,
	accuracy: 0
}
boar = {
	name: "Boar",
	health: 5,
	attack: 3,
	magic: 0,
	defense: 3,
	magic_defense: 0,
	agility: 1,
	accuracy: 0
}

goblin = {
	name: "Goblin",
	health: 25,
	attack: 6,
	magic: 2,
	defense: 5,
	magic_defense: 1,
	agility: 2,
	accuracy: 1
}
sabertusk = {
	name: "Sabertusk",
	health: 15,
	attack: 8,
	magic: 0,
	defense: 3,
	magic_defense: 0,
	agility: 3,
	accuracy: 2
}
giant = {
	name: "Giant",
	health: 25,
	attack: 15,
	magic: 0,
	defense: 4,
	magic_defense: 0,
	agility: 0,
	accuracy: 3
}
guardian = {
	name: "Guardian",
	health: 20,
	attack: 7,
	magic: 0,
	defense: 4,
	magic_defense: 5,
	agility: 0,
	accuracy: 0
}
easy_monsters = [slime, boar]
medium_monsters = [goblin, sabertusk]
hard_monsters = [giant, guardian]
enemies = [easy_monsters, medium_monsters, hard_monsters]




# UI for setup
# reset_screen
character_select(player_characters)
character = gets.chomp.downcase
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
player = GameCharacter.new(character)
puts "You have selected the #{player.name}"
sleep(1)
reset_screen
puts "Select your difficulty (Easy, Medium, Hard)"
sleep(1)
difficulty = gets.chomp.downcase
if difficulty == "easy"
	difficulty = 0
elsif difficulty == "medium"
	difficulty = 1
elsif difficulty == "hard"
	difficulty = 2
end
enemy = GameEnemy.new(enemies[difficulty][[0, 1].sample])
reset_screen
puts "Your story now begins..."
sleep(2)
puts "It has been some time since the fall of the last king. With his sacrifice, the world was rescued from ten years of darkness."
sleep(2)
puts "Yet after two long years, daemons still roam the land, attacking at night upon unsuspecting victims."
sleep(2)
puts "You are one of many under the organization called the Hunters, who protect travelers in their journeys across the land."
sleep(3)
reset_screen

# UI for battle
puts "Encountered Enemy #{enemy.name}!"
sleep(3)
until player.health <= 0 || enemy.health <= 0
	reset_screen
	selection = actions(player, enemy)
	if selection == "attack"
		puts "#{player.name} attacks with weapon!"
		player.attack(die, enemy)
	elsif selection == "magic attack"
		puts "#{player.name} attacks with magic!"
		player.magic(enemy)
	end
	sleep(2)
	enemy_selection = ["attack", "magic attack"].sample
	if enemy_selection == "attack"
		puts "#{enemy.name} attacks with weapon!"
		enemy.attack(die, player)
	elsif enemy_selection == "magic attack"
		puts "#{enemy.name} attacks with magic!"
		enemy.magic(player)
	end
	sleep(2)
end
if player.health < enemy.health
	puts "Defeated! Game Over"
elsif player.health > enemy.health
	puts "Victory! Traveler safely escorted."
end