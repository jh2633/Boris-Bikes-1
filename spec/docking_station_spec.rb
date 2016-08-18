require 'docking_station'

describe DockingStation do

before do
  @bike = double(:bike)
  allow(@bike).to receive(:working?).and_return(true)
  allow(@bike).to receive(:report_broken).and_return(false)
end

  describe '#release_bike' do
    it 'releases a docked bike' do
      subject.dock(@bike)
      expect(subject.release_bike).to eq(@bike)
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'should not release broken bikes' do
      @bike.report_broken
      allow(@bike).to receive(:working?).and_return(false)
      subject.dock(@bike)
      expect{subject.release_bike}.to raise_error 'No bikes available'
    end
  end

  describe 'docking bikes' do
    it 'docks something' do
      expect(subject.dock(@bike)).to eq [@bike]
    end

    it 'refuses more bikes when no capacity' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock @bike }
      expect {subject.dock(@bike)}.to raise_error 'Docking Station is full'
    end

    it 'should accept broken bikes' do
      @bike.report_broken
      allow(@bike).to receive(:working?).and_return(false)
      expect(subject.dock(@bike)).to eq([@bike])
    end
    it 'allows up to 30 bikes' do
      docking_station = DockingStation.new(30)
      30.times { docking_station.dock @bike }
      expect {docking_station.dock(@bike)}.to raise_error 'Docking Station is full'
    end
  end

end
