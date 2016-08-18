require 'docking_station'

describe DockingStation do

before do
  @working_bike = double(:bike, :working? => true)
  @broken_bike = double(:bike, :working? => false)
  @van = double(:van, :collect => true)
end



  describe '#release_bike' do
    it 'releases a docked bike' do
      subject.dock(@working_bike)
      expect(subject.release_bike).to eq(@working_bike)
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'should not release broken bikes' do
      subject.dock(@broken_bike)
      expect{subject.release_bike}.to raise_error 'No bikes available'
    end
  end

  describe 'docking bikes' do
    it 'docks something' do
      expect(subject.dock(@working_bike)).to eq [@working_bike]
    end

    it 'refuses more bikes when no capacity' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock @working_bike }
      expect {subject.dock(@working_bike)}.to raise_error 'Docking Station is full'
    end

    it 'should accept broken bikes' do
      expect(subject.dock(@broken_bike)).to eq([@broken_bike])
    end
    it 'allows up to 30 bikes' do
      docking_station = DockingStation.new(30)
      30.times { docking_station.dock @working_bike }
      expect {docking_station.dock(@working_bike)}.to raise_error 'Docking Station is full'
    end
  end

  it 'should take fixed bikes from van' do
    @fixed_bike = double(:bike, :working? =>true)
    expect(subject.collect([@fixed_bike])).to eq [@fixed_bike]
  end

  it 'van taking bike' do
    expect(subject.give_bike(@van)).to eq []
  end

end
