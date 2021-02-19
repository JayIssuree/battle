require 'player'

describe Player do

    let(:subject) { described_class.new(name: 'RSPEC Player') }
    let(:player2) { described_class.new(name: 'Player 2') }

    
    describe '#initialie' do
        
        it 'initializes with a name' do
            expect(subject.name).to eq('RSPEC Player')
        end

        it 'initializes with 100hp' do
            expect(subject.hp).to eq(100)
        end

    end

    describe '#attack' do
        
        it 'attacks another player' do
            expect{ subject.attack(player2) }.to change{ player2.hp }.by(-20)
        end

    end

end