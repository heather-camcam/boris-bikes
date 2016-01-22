require 'DockingStation'

describe DockingStation do
  let(:dummy_bike) { double :bike }
  subject(:DockingStation) {described_class.new}


# INITIALIZE TESTS

  describe "#initialize" do
    it "gives the docking station a default capacity of 20 when initializing a docking station" do
      expect(subject.capacity).to eq (20)
    end
    it "allows the user to set a default capacity when initializing a docking station" do
      station = DockingStation.new(45)
      45.times {station.dock dummy_bike}
      expect{station.dock dummy_bike}.to raise_error("Docking station full")
    end
  end

# DOCKING BIKE TESTS

  context 'responds to "dock" with one argument'
    it { is_expected.to respond_to(:dock).with(1).argument}

  it 'raises error "Docking Station Full" when docking station capacity is reached' do
    DockingStation::DEFAULT_CAPACITY.times {subject.dock(dummy_bike)}
    expect {subject.dock(dummy_bike)}.to raise_error("Docking station full")
  end

# ATTR_ READER TEST

  context 'responds to "bikes"'
    it { is_expected.to respond_to(:bikes)}
#
  describe '#release_bike' do
    it 'expects "release_bike" to get a working bike' do
      dummy_bike = double(broken?: false)
      subject.dock(dummy_bike)
      expect(subject.release_bike).to eq dummy_bike
    end

    it 'raises error "No Bikes Available" when docking station is empty' do
      expect { subject.release_bike }.to raise_error("No Bikes Available")
    end

    it 'raises error "Sorry, this Bike is Broken" when asked to release a broken bike.' do
      broken_bike = double(broken?: true, report_broken: true)
      subject.dock(broken_bike)
      expect {subject.release_bike}.to raise_error("Sorry, this Bike is Broken")
    end
  end

  describe '#release_broken_bikes' do

    it 'releases only the broken bikes' do
      broken_bike = double(broken?: true, report_broken: true)
      subject.dock(broken_bike)
      subject.release_broken_bikes
      expect(subject.bikes).to_not include broken_bike
    end

  end

end
