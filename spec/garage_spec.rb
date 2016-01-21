require 'garage'

describe Garage do
  let(:bike) {double(:bike)}
  before (:each) do
    bike1, bike2, bike3 = bike, bike, bike
    @test_bikes = [bike1,bike2,bike3]
  end

  it 'bikes can be loaded into the garage' do
    expect(subject.load_garage(@test_bikes)).to include bike
  end

end
