require_relative 'Bike'

class DockingStation

attr_reader :bike

  def initialize
    @bikes = []
  end

  def release_bike   # Doing 2 things
    if @bikes.empty?   # => Defining the capacity
      raise Exception.new("No Bikes Available")
    else
      @bikes.pop    # => Removing a bike
    end
  end

  def dock(potato)   # Doing 2 things
    if full?
      raise Exception.new("Docking station full")
    else
       @bikes << potato
    end
  end

  def full?
    @bikes.size >= 20
  end

  def empty?
    @bikes.empty?
  end
end
