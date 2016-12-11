require_relative '../enemy_class'

describe 'initialize' do
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
	let(:enemy) {GameEnemy.new(slime)}

	it 'stores the various stats in a hash' do
		expect(enemy.name).to eq "Slime"
		expect(enemy.health).to eq 10
		expect(enemy.power).to eq 2
		expect(enemy.magic).to eq 0
		expect(enemy.defense).to eq 2
		expect(enemy.magic_defense).to eq 2
		expect(enemy.agility).to eq 0
		expect(enemy.accuracy).to eq 0
	end
end