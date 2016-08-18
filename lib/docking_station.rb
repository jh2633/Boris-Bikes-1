require_relative 'bike'

class DockingStation

  def initialize
    @bike_store = []
  end

  def release_bike
    fail 'No bikes available' if vacuous?
    @bike_store.pop
  end

  def dock(bike)
    fail 'Docking Station is full' if full?
    @bike_store << bike
  end

private
  attr_reader :bike_store

  def full?
    @bike_store.length >= 20
  end
  def vacuous?
    @bike_store == []
  end
end
