require 'game'

describe Game do

    let(:player1) { double :player, :reduce_hp => nil }
    let(:player2) { double :player, :reduce_hp => nil }
    let(:subject) { described_class.new(player1: player1, player2: player2) }
    
    describe '#initialize' do
        
        it 'is initialized with 2 players' do
            expect(subject.player1).to eq(player1)
            expect(subject.player2).to eq(player2)
            expect(subject.players.length).to eq(2)
        end

    end

    describe '#attack_defender' do
        
        it 'calls reduce_hp on the defending player' do
            expect(player2).to receive(:reduce_hp)
            subject.attack_defender
        end

    end

    describe '#current_turn' do

        it 'returns the current_turns player' do
            expect(subject.attacking_player).to eq(player1)
        end

        it 'changes the current_turn to the player that has just been attacked' do
            subject.attack_defender
            expect(subject.attacking_player).to eq(player2)
        end

    end

end