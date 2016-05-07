class PassengerCar < Car

  def take_space
    raise 'This passenger car is full' if space_taken == space
    self.space_taken += 1
  end

  def validate!
    raise 'Capacity should be a positive integer' unless space.is_a?(Integer) && space > 0
    true
  end
end