require_relative 'bike'
require_relative 'van'
require_relative 'garage'
class DockingStation
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @broken_bike_store = []
    @fixed_bike_store = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if vacuous?
    @fixed_bike_store.pop
  end

  def dock(bike)
    fail 'Docking Station is full' if full?
    if bike.working?
      @fixed_bike_store << bike
    else
      @broken_bike_store << bike
    end
  end

  def give_bike(destination,target)
    if target == :fixed
      destination.collect(@fixed_bike_store)
      @fixed_bike_store = []
    elsif target == :broken
      destination.collect(@broken_bike_store)
      @broken_bike_store = []
    end
  end

  def collect(bikes,target)
    if target == :fixed
      @fixed_bike_store += bikes
    elsif target == :broken
      @broken_bike_store += bikes
    end
  end

private
  attr_reader :bike_store

  def full?
    @fixed_bike_store.length + @broken_bike_store.length >= @capacity
  end
  def vacuous?
    @fixed_bike_store == []
  end
end
