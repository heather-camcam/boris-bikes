require 'van'

describe Van do

  let(:bike) {double(:bike)}

  it { is_expected.to respond_to(:load_van) }

  it 'bikes can be added to van' do
    expect(subject.load_van(bike)).to include bike
  end

  it 'can take a bike out of van' do
    subject.load_van(bike)
    expect(subject.release_bikes).to include bike
  end

  it 'removes all bikes so van is empty' do
    subject.load_van(bike)
    subject.release_bikes
    expect(subject.bikes.length).to eq 0 
  end

end
