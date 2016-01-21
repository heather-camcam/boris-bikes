require_relative 'Bike'

class DockingStation

DEFAULT_CAPACITY = 20
attr_reader :bike, :capacity

  def initialize (capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "No Bikes Available" if empty?
      @bikes.pop    # => Removing a bike
  end

  def dock(bike)
    raise "Docking station full" if full?
    @bikes << bike # => Shovelling a bike into the array
  end

private


  def full?
    @bikes.size >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end
