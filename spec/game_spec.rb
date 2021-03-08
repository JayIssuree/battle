require 'game'

describe Game do

    let(:player1) { double :player, :reduce_hp => nil, :execute_damage_from_status_effects => nil }
    let(:player2) { double :player, :reduce_hp => nil, :status_effects => [], :clear_expired_status_effects => nil, :execute_damage_from_status_effects => nil }
    let(:attack1) { double :attack }
    let(:defence1) { double :defence }
    let(:paralyze) { double :paralyze, :incriment_move_count => nil }
    let(:subject) { described_class.new(player1: player1, player2: player2) }

    describe '.create' do

        it 'creates an instance of Game' do
            expect(described_class.create(player1: player1, player2: player2)).to be_an_instance_of(described_class)
        end

    end

    describe '.current_game' do
        
        it 'returns the current game' do
            described_class.create(player1: player1, player2: player2)
            expect(described_class.current_game).to be_an_instance_of(described_class)
        end

    end
    
    describe '#initialize' do
        
        it 'is initialized with 2 players' do
            expect(subject.player1).to eq(player1)
            expect(subject.player2).to eq(player2)
            expect(subject.players.length).to eq(2)
        end

    end

    describe '#switch_turns' do

        it 'returns the current_turns player' do
            expect(subject.attacking_player).to eq(player1)
        end

        it 'changes the current_turn to the player that has just been attacked' do
            subject.switch_turns
            expect(subject.attacking_player).to eq(player2)
        end

        it 'incriments the status effects at the end of each turn' do
            allow(player2).to receive(:status_effects).and_return([paralyze])
            expect(paralyze).to receive(:incriment_move_count)
            subject.switch_turns
        end

        it 'clears the status effects if possible at the end of each turn' do
            allow(player2).to receive(:status_effects).and_return([paralyze])
            expect(player2).to receive(:clear_expired_status_effects)
            subject.switch_turns
        end

    end

    describe '#attack_defender(move_name)' do
        
        it 'call the correct method chain on the attacking player' do
            expect(player1).to receive(:select_attack).with("attack1").and_return(attack1)
            expect(attack1).to receive(:attack).with(player2)
            subject.attack_defender("attack1")
        end

    end

    describe '#defend_current_player(move_name)' do

        it 'calls the correct method chain on the current player' do
            expect(player1).to receive(:select_defence).with("defence1").and_return(defence1)
            expect(defence1).to receive(:on).with(player1)
            subject.defend_current_player("defence1")
        end
        
    end

    describe '#finished?' do
        
        it 'is true when a player reaches 0 HP' do
            allow(player1).to receive(:hp).and_return(20)
            allow(player2).to receive(:hp).and_return(0)
            expect(subject).to be_finished
        end

    end

    describe '#loser' do
        
        it 'returns the losing player' do
            allow(player1).to receive(:hp).and_return(20)
            allow(player2).to receive(:hp).and_return(0)
            expect(subject.loser).to eq(player2)
        end

    end

end