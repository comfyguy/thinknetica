class PassengerCar < Car

  attr_reader :seats_taken

  def initialize(max_capacity)
    super
    validate!
    @seats_taken = 0
  end

  def take_seat
    raise 'Maximum capacity reached' if seats_taken == max_capacity
    self.seats_taken += 1
  end

  def free_seats
    max_capacity - seats_taken
  end

  private

  attr_writer :seats_taken
  attr_reader :max_capacity

  def validate!
    raise 'Capacity should be an integer' if max_capacity.class != Fixnum
    @max_capacity = max_capacity
    true
  end
end
