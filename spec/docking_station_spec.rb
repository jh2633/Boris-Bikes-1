require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to be_working
  end

  describe '#release_bike' do
    it 'releases a docked bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike

    end
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bike) }

  #it 'raises an error' do
  #expect { NoMethodError }.to raise_error(NoMethodError)
  #end

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end
end
