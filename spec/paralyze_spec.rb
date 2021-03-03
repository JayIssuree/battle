require './lib/attacks/paralyze'

describe Paralyze do

    let(:subject) { described_class }
    let(:player) { double :player }

    describe '#attack(player)' do
        
        it 'does the attack on the player' do
            allow(subject).to receive(:hit?).and_return(true)
            expect(player).to receive(:become_paralyzed)
            subject.attack(player)
        end

        it 'does not attack the player if the move misses' do
            allow(subject).to receive(:hit?).and_return(false)
            expect(player).to_not receive(:become_paralyzed)
        end

    end

end