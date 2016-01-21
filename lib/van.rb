class Van

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def load_van(bike)
    #@bikes += bike
    bikes << bike
  end

  def release_bikes
    bikes.pop(bikes.length)
  end

end
