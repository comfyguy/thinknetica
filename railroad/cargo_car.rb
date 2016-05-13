class CargoCar < Car
  def take_space(cargo)
    raise 'Cargo volume should be a positive number' unless cargo.is_a?(Numeric) && cargo > 0
    raise 'Not enough free space' if space_taken + cargo > space
    self.space_taken += cargo
  end

  def validate!
    raise 'Capacity should be a positive number' unless space.is_a?(Numeric) && space > 0
    true
  end
end
