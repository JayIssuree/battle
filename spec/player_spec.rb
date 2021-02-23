require 'player'

describe Player do

    let(:subject) { described_class.new(name: 'RSPEC Player') }
    
    describe '#initialie' do
        
        it 'initializes with a name' do
            expect(subject.name).to eq('RSPEC Player')
        end

        it 'initializes with default hp value' do
            expect(subject.hp).to eq(Player::DEFAULT_HP)
        end

        it 'can be initialized with a hp of choice' do
            new_hp = 20
            player2 = described_class.new(name: 'Player 2', hp: new_hp)
            expect(player2.hp).to eq(new_hp)
        end

    end

    describe '#reduce_hp' do
        
        it 'reduces the hit points of the player by a random amount' do
            expect{ subject.reduce_hp }.to change{ subject.hp }
        end

    end

end