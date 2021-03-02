require 'computer'

describe Computer do
    
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

    end

    describe '#reduce_hp' do
        
        it 'reduces the hit points of the computer by a random amount' do
            expect{ subject.reduce_hp(15) }.to change{ subject.hp }
        end

    end

end