require_relative '../character_class'

describe 'initialize' do
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
	let(:player) {GameCharacter.new(fighter)}

	it 'stores the various stats in a hash' do
		expect(player.name).to eq "Fighter"
		expect(player.health).to eq 100
		expect(player.power).to eq 12
		expect(player.magic).to eq 0
		expect(player.defense).to eq 10
		expect(player.magic_defense).to eq 8
		expect(player.agility).to eq 1
		expect(player.accuracy).to eq 2
	end
end