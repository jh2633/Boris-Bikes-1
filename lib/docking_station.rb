require_relative 'bike'

class DockingStation

  def initialize
    @bike_store = []
  end

  def release_bike
    fail 'No bikes available' if @bike_store.empty?
    @bike_store.pop
  end

  def dock(bike)
    fail 'Docking Station is full' if @bike_store.length >= 20
    @bike_store << bike
  end

private
  attr_reader :bike_store
end
