require 'DockingStation'

describe DockingStation do
  subject(:DockingStation) {described_class.new}


# INITIALIZE TESTS

  describe "#initialize" do
    it "gives the docking station a default capacity of 20 when initializing a docking station" do
      expect(subject.capacity).to eq (20)
    end
    it "allows the user to set a default capacity when initializing a docking station" do
      station = DockingStation.new(45)
      45.times {station.dock Bike.new}
      expect{station.dock Bike.new}.to raise_error("Docking station full")
    end
  end

# DOCKING BIKE TESTS

  context 'responds to "dock" with one argument'
    it { is_expected.to respond_to(:dock).with(1).argument}

  it 'raises error "Docking Station Full" when docking station capacity is reached' do  ####TROUBLE
    DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)} #GUARD CONDITION
    expect {subject.dock(Bike.new)}.to raise_error("Docking station full")
  end

# ATTR_ READER TEST

  context 'responds to "bike"'
    it { is_expected.to respond_to(:bike)}



# RELEASE BIKES TESTS

  it { should respond_to(:release_bike) }

  describe '#release_bike' do
    it 'expects "release_bike" to get a working bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises error "No Bikes Available" when docking station is empty' do
      expect { subject.release_bike }.to raise_error("No Bikes Available")
    end
  end


end
