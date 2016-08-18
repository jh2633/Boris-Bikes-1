
class Van
  def initialize
    @broken_bike_store = []
    @fixed_bike_store = []
  end


  def collect(bikes)
    @broken_bike_store += bikes
  end

  def collect_fix_bike(bikes)
    @fixed_bike_store += bikes
  end

  def drop_fix_bike(docking_station)
    docking_station.collect(@fixed_bike_store)
    @fixed_bike_store = []
  end

  def drop(garage)
    garage.collect(@broken_bike_store)
    @broken_bike_store = []
  end

end
