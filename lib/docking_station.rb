require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity

# dockingstation assumes to have no bikes
  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "No bikes available!" if empty?
    raise "Bike is broken" if bikes[-1].broken?
    bikes.pop
  end

  def dock_bike(bike)
    raise "Station is full!" if full?
    bikes << bike
  end

  private
    def full?
      bikes.size >= capacity
    end

    def empty?
      bikes.size == 0
    end

end
