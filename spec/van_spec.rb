require 'van'

describe Van do

  it 'collect broken bike' do
  @broken_bike = double(:bike, :working? => false)
  expect(subject.collect([@broken_bike])).to eq [@broken_bike]
  end

  it 'drops off broken bikes at the garage' do
    @broken_bike = double(:bike, :working? => false)
    subject.collect([@broken_bike])
    @garage = double(:garage, :collect => true)
    expect(subject.drop(@garage)).to eq []
  end

  it 'picks up fixed bikes' do
    @fixed_bike = double(:bike, :working? => true)
    expect(subject.collect_fix_bike([@fixed_bike])).to eq [@fixed_bike]
  end

  it 'drops off fixed bikes at the docking station' do
    @fixed_bike = double(:bike, :working? => true)
    subject.collect_fix_bike([@fixed_bike])
    @docking_station = double(:docking_station, :collect => true)
    expect(subject.drop_fix_bike(@docking_station)).to eq []
  end





end
