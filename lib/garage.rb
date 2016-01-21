class Garage

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def load_garage(bike)
    bikes.concat bike
  end

  def fix_bike(bike)
    bike.broken_status = false
  end

end
