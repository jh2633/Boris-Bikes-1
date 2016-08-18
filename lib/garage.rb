class Garage
  def initialize
    @broken_bike_store = []
    @fixed_bike_store = []
  end

  def collect(bikes)
    @broken_bike_store += bikes
  end

  def fixing
    @broken_bike_store.each {|x| x.fix}
    @fixed_bike_store += @broken_bike_store
    @broken_bike_store = []
  end

  def drop_fix_bike(van)
    van.collect_fix_bike(@fixed_bike_store)
    @fixed_bike_store = []
  end
end
