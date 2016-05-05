class CargoCar < Car

  attr_reader :space_used

  def initialize(max_capacity)
    super
    validate!
    @space_used = 0
  end


  def load(cargo)
    raise 'Cargo volume should be a number'\
    unless cargo.class == Fixnum || cargo.class == Float
    raise 'Maximum capacity reached' if space_used + cargo > max_capacity
    self.space_used += cargo
  end

  def free_space
    max_capacity - space_used
  end

  private

  attr_writer :space_used
  attr_reader :max_capacity

  def validate!
    raise 'Capacity should be a number'\
    unless max_capacity.class == Fixnum || max_capacity.class == Float
    true
  end

end
