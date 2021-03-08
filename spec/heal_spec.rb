require './lib/defences/heal'

describe Heal do
    
    let(:subject) { described_class }
    let(:player) { double :player }

    describe '#on(player)' do
        
        it 'increases the healthpoints of the player' do
            allow(subject).to receive(:hit?).and_return(true)
            allow(subject).to receive(:calculate_heal).and_return(15)
            expect(player).to receive(:increase_hp).with(15)
            subject.on(player)
        end

    end

end