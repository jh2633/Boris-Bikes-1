require 'garage'

describe Garage do

  it 'collect broken bike' do
  @broken_bike = double(:bike, :working? => false)
  expect(subject.collect([@broken_bike])).to eq [@broken_bike]
  end

  it 'fixes bikes' do
  @broken_bike = double(:bike, :working? => false, :fix => true)
  subject.collect([@broken_bike])
  expect(subject.fixing).to eq []
  end

  it 'drops off working bike to van' do
    @broken_bike = double(:bike, :working? => false, :fix => true)
    subject.collect([@broken_bike])
    subject.fixing
    @van = double(:van, :collect_fix_bike => true)
    expect(subject.drop_fix_bike(@van)).to eq []
  end
end
