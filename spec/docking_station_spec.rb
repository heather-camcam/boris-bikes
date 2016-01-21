require 'docking_station'

describe DockingStation do

  #let(:bike) {double(:bike, working?: true,
  #  broken?: false)}

  let(:bike) {double(:bike)}

  it { is_expected.to respond_to(:release_bike) }

  it 'check if bike is working' do
    #allow(bike).to receive(:working?).and_return(true)
    bike = double(:bike, working?: true)
    expect(bike.working?).to eq true
  end

  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  it { is_expected.to respond_to(:bikes) }

  it 'dock bike' do
    expect(subject.dock_bike(bike)).to include bike
  end

  it 'check the same bike exists' do
    subject.dock_bike(bike)
    expect(subject.bikes).to include bike
  end

  it 'release a bike when it is available' do
    #allow(bike).to receive(:broken?).and_return(false)
    bike = double(:bike, broken?: false)
    subject.dock_bike(bike)
    expect(subject.release_bike).to eq bike
  end

  it 'raise an error when no bikes are available' do
    expect { subject.release_bike }.to raise_error("No bikes available!")
  end

  it 'raise an error when station is full' do
    DockingStation::DEFAULT_CAPACITY.times { subject.dock_bike(bike) }
    expect { subject.dock_bike(bike) }.to raise_error("Station is full!")
  end

end
