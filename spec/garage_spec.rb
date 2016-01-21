require 'garage'

describe Garage do
  let(:bike) {double(:bike)}
  let(:broken_bike) {double(:bike, working?: false)}
  before (:each) do
    bike1, bike2, bike3 = bike, bike, bike
    @test_bikes = [bike1,bike2,bike3]
  end

  it 'bikes can be loaded into the garage' do
    expect(subject.load_garage(@test_bikes)).to include bike
  end

  it 'fixes broken bikes' do
    allow(broken_bike).to receive(:fix_bike).and_return(false)
    allow(broken_bike).to receive(:working?).and_return(true)
    allow(broken_bike).to receive(:broken_status=).and_return(false)
    subject.fix_bike(broken_bike)
    expect(broken_bike.working?).to eq(true)
  end

end
