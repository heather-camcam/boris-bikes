require_relative 'Bike'

class DockingStation

DEFAULT_CAPACITY = 20
attr_reader :bikes, :capacity

  def initialize (capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "No Bikes Available" if @bikes.empty?
    raise "Sorry, this Bike is Broken" if @bikes[-1].broken?
      @bikes.pop
  end

  def dock(bike)
    raise "Docking station full" if full?
    @bikes << bike # => Shovelling a bike into the array
  end

  def release_broken_bikes
    broken_bikes = []
    bikes.each do |bike|
      broken_bikes << bike if bike.broken?
    end
    bikes.delete_if {|bike| bike.broken?}
  end

private

  def full?
    @bikes.size >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end
