require 'Bike'

#CHECK METHODS EXIST

describe Bike do
  subject(:bike) { described_class.new }

  it { should respond_to(:working?) }

#BROKEN TESTS

  it { should respond_to(:report_broken) }

  it { should respond_to(:broken?) }


  describe '#broken?' do
    it 'returns true when bike is broken' do
      expect(bike.broken?).to be true
    end
  end

end
