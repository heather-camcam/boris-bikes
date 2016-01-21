require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to(:release_bike) }

  it 'check if bike is working' do
    bike = Bike.new
    expect(bike.working?).to eq true
  end

  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  it { is_expected.to respond_to(:bikes) }

  it 'dock bike' do
    bike = Bike.new
    expect(subject.dock_bike(bike)).to include bike
  end

  it 'check the same bike exists' do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.bikes).to include bike
  end

  it 'release a bike when it is available' do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.release_bike).to eq bike
  end

  it 'raise an error when no bikes are available' do
    expect { subject.release_bike }.to raise_error("No bikes available!")
  end

  it 'raise an error when station is full' do
    DockingStation::DEFAULT_CAPACITY.times { subject.dock_bike(Bike.new) }
    expect { subject.dock_bike(Bike.new) }.to raise_error("Station is full!")
  end

  it 'able to enter station capacity' do
    station = DockingStation.new(50)
    expect(station.capacity).to eq(50)
  end

  it 'capacity defaults to 20 if not added' do
    #station = DockingStation.new
    expect(subject.capacity).to eq(20)
  end

  it 'station has variable capacity' do
    station = DockingStation.new(50)
    50.times { station.dock_bike(Bike.new) }
    expect { station.dock_bike(Bike.new) }.to raise_error("Station is full!")
  end
end
