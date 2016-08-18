require 'docking_station'

describe DockingStation do
  
  describe '#release_bike' do
    it 'releases a docked bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe 'docking bikes' do
    it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'refuses more bikes when no capacity' do
      20.times { subject.dock Bike.new }
      expect {subject.dock(Bike.new)}.to raise_error 'Docking Station is full'
    end
  end

end
