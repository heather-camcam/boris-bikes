require_relative 'Bike'

class DockingStation

attr_reader :bike

  def initialize
    @bikes = []
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
    @bikes.size >= 20
  end

  def empty?
    @bikes.empty?
  end
end
