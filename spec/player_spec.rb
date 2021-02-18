require 'player'

describe Player do

    let(:subject) { described_class.new(name: 'RSPEC Player') }
    
    describe '#initialie' do
        
        it 'initializes with a name' do
            expect(subject.name).to eq('RSPEC Player')
        end

    end

end