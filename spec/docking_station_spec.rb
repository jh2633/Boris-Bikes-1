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

    it 'should not release broken bikes' do
      bike=Bike.new
      bike.report_broken
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error 'No bikes available'
    end
  end

  describe 'docking bikes' do
    it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'refuses more bikes when no capacity' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
      expect {subject.dock(Bike.new)}.to raise_error 'Docking Station is full'
    end

    it 'should accept broken bikes' do
      bike=Bike.new
      bike.report_broken
      expect(subject.dock(bike)).to eq([bike])
    end
    it 'allows up to 30 bikes' do
      docking_station = DockingStation.new(30)
      30.times { docking_station.dock Bike.new }
      expect {docking_station.dock(Bike.new)}.to raise_error 'Docking Station is full'
    end
  end

end
