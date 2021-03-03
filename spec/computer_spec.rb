require 'computer'

describe Computer do

    let(:subject) { described_class.new(move_list: move_list) }
    let(:attack1) { double :attack, :name => "attack1" }
    let(:move_list) { [attack1] }
    
    describe '#initialize' do
        
        it 'has the name of Computer' do
            expect(subject.name).to eq("Computer")
        end

        it 'initializes with default hp value' do
            expect(subject.hp).to eq(Computer::DEFAULT_HP)
        end

        it 'can be initialized with a hp of choice' do
            new_hp = 20
            computer = described_class.new(hp: new_hp)
            expect(computer.hp).to eq(new_hp)
        end

        it 'is initialized with a default set of moves' do
            expect(subject.move_list).to eq(move_list)
        end

    end

    describe '#reduce_hp' do
        
        it 'reduces the hit points of the computer by a random amount' do
            expect{ subject.reduce_hp(15) }.to change{ subject.hp }
        end

    end

    describe '#random_move' do
        
        it 'returns a random move' do
            expect(subject.random_move).to eq(attack1)
        end

    end

end