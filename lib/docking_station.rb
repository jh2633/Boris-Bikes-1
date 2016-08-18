require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bike_store = []
    @broken_bike_store = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if vacuous?
    @bike_store.pop
  end

  def dock(bike)
    fail 'Docking Station is full' if full?
    if bike.working?
      @bike_store << bike
    else
      @broken_bike_store << bike
    end
  end

private
  attr_reader :bike_store

  def full?
    @bike_store.length + @broken_bike_store.length >= @capacity
  end
  def vacuous?
    @bike_store == []
  end
end
