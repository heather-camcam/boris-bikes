class Bike

  attr_accessor :broken_status

  def working?
    true unless broken_status
  end

  def bike_broken
    @broken_status = true
  end

  #def broken?
  #  @broken_status
  #end
end
