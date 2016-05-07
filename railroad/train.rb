class Train

  include InstancesStorage
  include Vendor

  ID_FORMAT = /[a-z0-9]{3}-?[a-z0-9]{2}$/i

  attr_reader :id, :cars

  def initialize(id, cars = 0)
    @id = id
    @speed = 0
    @cars = []
    validate!
    cars.each { |car| add_car(car) } unless cars == 0
    store_instance
  end

  def speed_up(increment)
    self.speed += increment
  end

  def current_speed
    speed
  end

  def stop
    self.speed = 0
  end

  def cars_amount
    cars.size
  end

  def accept_route(train_route)
    raise 'Route is not valid' unless train_route.is_a?(Route)
    self.route = train_route
    self.current_station = 0
  end

  def show_route
    return if route.nil?
    puts "Previous station was #{route.station(current_station - 1).id}"\
     if previous_station?
    puts "Current station is #{route.station(current_station).id}"
    puts "Next station will be #{route.station(current_station + 1).id}"\
     if next_station?
  end

  def go_forward
    raise 'The train has reached its final destination' unless next_station?
    self.current_station += 1
  end

  def go_back
    raise 'The train is already at the first station' unless previous_station?
    self.current_station -= 1
  end

  def add_car(car)
    raise 'Car is not valid' if car.class != self.class.type_of_car
    check_speed!
    cars << car
  end

  def remove_car
    raise 'The train has no cars' unless cars.size > 0
    check_speed!
    cars.delete_at(-1)
  end

  def each_car(&block)
    cars.each { |car| yield(car) }
  end

  def valid?
    validate!
  rescue
    false
  end

  protected

  attr_accessor :speed, :route, :current_station
  attr_writer :cars

  def validate!
    raise 'Train id should be a string' if id.class != String
    raise 'Train id has invalid format' if id !~ ID_FORMAT
    raise 'You are not allowed to create instances of base class' if\
     self.class == Train
    true
  end

  def check_speed!
    raise 'You should stop the train first' unless speed.zero?
  end

  def next_station?
    route.station(current_station + 1)
  end

  def previous_station?
    false
    true if current_station > 0
  end

end
