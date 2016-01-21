

class Bike
  attr_reader :bike_broken
  def working?
    true
  end

  def bike_broken
    bike_broken = true
  end

  def broken?
    true if bike_broken
  end
end
