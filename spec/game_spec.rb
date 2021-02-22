require 'game'

describe Game do

    let(:player1) { double :player, :reduce_hp => nil }
    let(:player2) { double :player, :reduce_hp => nil }
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