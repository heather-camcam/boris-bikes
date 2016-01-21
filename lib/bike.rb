class Bike

  def working?
    true
  end

  def bike_broken
    @broken_status = true
  end

  def broken?
    @broken_status
  end
end
