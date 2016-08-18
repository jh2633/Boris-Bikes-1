class Garage
  def initialize
    @broken_bike_store = []
    @fixed_bike_store = []
  end

  def collect(bikes,target)
    if target == :fixed
      @fixed_bike_store += bikes
    elsif target == :broken
      @broken_bike_store += bikes
    end
  end

  def give_bike(destination,target)
    if target == :fixed
      destination.collect(@fixed_bike_store)
      @fixed_bike_store = []
    elsif target == :broken
      destination.collect(@broken_bike_store)
      @broken_bike_store = []
    en

  def fixing
    @broken_bike_store.each {|x| x.fix}
    @fixed_bike_store += @broken_bike_store
    @broken_bike_store = []
  end

end
