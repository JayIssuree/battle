require 'player'

describe Player do

    let(:subject) { described_class.new(name: 'RSPEC Player', attack_list: attack_list, defence_list: defence_list) }
    let(:attack1) { double :attack, :name => "attack1" }
    let(:attack2) { double :attack, :name => "attack2" }
    let(:attack3) { double :attack, :name => "attack3" }
    let(:paralyze_class) { double :paralyze_class, :name => "Paralyze" }
    let(:paralyze) { double :paralyze, :class => paralyze_class, :over? => nil }
    let(:poison_class) { double :poison_class, :name => "Poison" }
    let(:poison) { double :poison, :class => poison_class, :over? => nil, :damage => 10 }
    let(:attack_list) { [attack1, attack2, attack3] }
    let(:defence1) { double :defence, :name => "defence1" }
    let(:defence_list) { [defence1] }
    
    describe '#initialie' do
        
        it 'initializes with a name' do
            expect(subject.name).to eq('RSPEC Player')
        end

        it 'initializes with default hp value' do
            expect(subject.hp).to eq(Player::DEFAULT_HP)
        end

        it 'can be initialized with a hp of choice' do
            new_hp = 20
            player2 = described_class.new(name: 'Player 2', hp: new_hp)
            expect(player2.hp).to eq(new_hp)
        end

        it 'is initialized with a default set of attacking moves' do
            expect(subject.attack_list).to eq(attack_list)
        end

        it 'is initialized with a default set of defending moves' do
            expect(subject.defence_list).to eq(defence_list)
        end

        it 'is initialzed not paralyzed' do
            expect(subject).to_not be_paralyzed
        end

    end

    describe '#reduce_hp' do
        
        it 'reduces the hit points of the player' do
            expect{ subject.reduce_hp(15) }.to change{ subject.hp }.by(-15)
        end

    end

    describe '#increase_hp' do
        
        it 'increases the hit points of the player' do
            expect{ subject.increase_hp(15) }.to change{ subject.hp }.by(15)
        end

    end

    describe '#select_move(move_name)' do
        
        it 'returns either an attacking or defensive move' do
            expect(subject.select_move('attack1')).to eq(attack1)
        end

        it 'returns either an attacking or defensive move' do
            expect(subject.select_move('defence1')).to eq(defence1)
        end

    end

    context '#status_effects' do

        describe '#add_status_effect(move)' do
            
            it 'adds the status effect to the player' do
                expect{ subject.add_status_effect(paralyze) }.to change{ subject.status_effects.length }.by(1)
            end

        end
    
        describe '#paralyzed' do
            
            it 'returns true when the player is paralyzed' do
                subject.add_status_effect(paralyze)
                expect(subject.paralyzed?).to be(true)
            end
    
        end

        describe '#poisoned' do
            
            it 'returns true when the player is poisoned' do
                subject.add_status_effect(poison)
                expect(subject.poisoned?).to be(true)
            end
    
        end

        describe '#clear_expired_status_effects' do
            
            it 'removes the effect once it it over' do
                subject.add_status_effect(paralyze)
                allow(paralyze).to receive(:over?).and_return(true)
                subject.clear_expired_status_effects
                expect(subject).to_not be_paralyzed
            end

        end

        describe '#execute_damage_from_status_effects' do
            
            it 'reduces the hp of the player depending on status effects' do
                subject.add_status_effect(poison)
                expect{ subject.execute_damage_from_status_effects }.to change{ subject.hp }.by(-10)
            end

        end

    end

end