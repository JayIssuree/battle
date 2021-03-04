require './lib/attacks/paralyze'

describe Paralyze do

    let(:subject) { described_class }
    let(:paralyze) { subject.new }
    let(:player) { double :player, :add_status_effects => nil }

    describe '#attack(player)' do
        
        it 'does the attack on the player' do
            allow(subject).to receive(:hit?).and_return(true)
            expect(player).to receive(:add_status_effect)
            subject.attack(player)
        end

        it 'does not attack the player if the move misses' do
            allow(subject).to receive(:hit?).and_return(false)
            expect(player).to_not receive(:add_status_effect)
        end

    end

    describe '#move_count' do
        
        it 'is initialized at 0' do
            expect(paralyze.move_count).to eq(0)
        end

        it 'incriments the move count' do
            expect{ paralyze.incriment_move_count }.to change{ paralyze.move_count }.by(1)
        end

        it 'determines if the status effect has ended' do
            paralyze.incriment_move_count
            paralyze.incriment_move_count
            paralyze.incriment_move_count
            expect(paralyze).to be_over
        end

    end

end