require 'game'

describe Game do

    let(:player1) { double :player }
    let(:player2) { double :player }
    let(:subject) { described_class.new(player1: player1, player2: player2) }
    
    describe '#initialize' do
        
        it 'is initialized with 2 players' do
            expect(subject.player1).to eq(player1)
            expect(subject.player2).to eq(player2)
        end

    end

    describe '#attack(player)' do
        
        it 'calls reduce_hp on the attacked player' do
            expect(player1).to receive(:reduce_hp)
            subject.attack(player1)
        end

    end

end