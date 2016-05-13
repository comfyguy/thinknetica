class Car
  include Vendor
  include InstanceCounter
  include InstancesStorage

  attr_reader :id, :space_taken

  def initialize(space)
    @space = space
    @space_taken = 0
    validate!
    @id = register_instance
    store_instance
  end

  def free_space
    space - space_taken
  end

  protected

  attr_writer :space_taken
  attr_reader :space

  def validate!
    raise 'You are not allowed to create instances of base class'
  end
end
