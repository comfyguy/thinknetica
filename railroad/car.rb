class Car
  include Vendor
  include InstanceCounter
  include CommonMethods

  attr_reader :id

  def initialize(max_capacity)
    @id = register_instance
    @max_capacity = max_capacity
  end
end
