require 'game'

describe Game do

    let(:player1) { double :player, :reduce_hp => nil }
    let(:player2) { double :player, :reduce_hp => nil }
    let(:attack1) { double :attack, :name => "attack1" }
    let(:attack2) { double :attack, :name => "attack2" }
    let(:attack3) { double :attack, :name => "attack3" }
    let(:attack_list) { [attack1, attack2, attack3] }
    let(:subject) { described_class.new(player1: player1, player2: player2, attack_list: attack_list) }

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

    describe '#current_turn' do

        it 'returns the current_turns player' do
            expect(subject.attacking_player).to eq(player1)
        end

        it 'changes the current_turn to the player that has just been attacked' do
            subject.switch_turns
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

    context 'attack_list' do
        
        it 'is initialized with a set of attacking moves' do
            expect(subject.attack_list).to eq(attack_list)
        end

        it 'attacks the defending player with a given move' do
            expect(attack1).to receive(:attack).with(subject.defending_player)
            subject.attack_defender("attack1")
        end

    end

end