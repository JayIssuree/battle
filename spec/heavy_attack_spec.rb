require 'heavy_attack'

describe HeavyAttack do

    let(:subject) { described_class }
    let(:player) { double :player }

    describe '#attack(player)' do
        
        it 'does the attack on the player' do
            allow(subject).to receive(:hit?).and_return(true)
            allow(subject).to receive(:calculate_damage).and_return(20)
            expect(player).to receive(:reduce_hp).with(20)
            subject.attack(player)
        end

        it 'does not attack the player if the move misses' do
            allow(subject).to receive(:hit?).and_return(false)
            expect(player).to_not receive(:reduce_hp)
        end

    end

end