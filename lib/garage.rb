class Garage

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def load_garage(bike)
    bikes.concat bike
  end

end
