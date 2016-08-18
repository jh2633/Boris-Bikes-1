require 'Bike'

describe Bike do
 it 'should be working when created' do
   expect(subject.working?).to eq(true)
 end

it 'should be able to be reported broken' do
  bike = Bike.new
  bike.report_broken
  expect(bike.working?).to eq(false)
end

end
