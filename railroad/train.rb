class Train

  include CommonMethods
  include Vendor

  ID_FORMAT = /[a-z0-9]{3}-?[a-z0-9]{2}$/i

  attr_reader :id 

  def initialize(id, cars = 0)
    @id = id
    @speed = 0
    @cars = []
    cars.each { |car| add_car(car) } unless cars == 0
    validate!
  end

  def valid?
    validate!
  rescue
    false
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
    self.route = train_route
    self.current_station = 0
  end

  def show_route
    return if route.nil?
    puts "Previous station was #{route.station(current_station - 1).id}"\
    unless current_station.zero?
    puts "Current station is #{route.station(current_station).id}"
    puts "Next station will be #{route.station(current_station + 1).id}"\
    unless route.station(current_station + 1).nil?
  end

  def go_forward
    self.current_station += 1 unless route.station(current_station + 1).nil?
  end

  def go_back
    self.current_station -= 1 unless current_station.zero?
  end

  def add_car(car)
    raise 'Incorrect railroad car type' if car.class != self.class.type_of_car
    raise 'You should stop the train first' unless speed.zero?
    cars << car
  end

  def remove_car
    cars.delete_at(-1) if speed.zero? && cars.size > 0
  end

  def self.type_of_car
    Car
  end

  def self.type_of_train
    'train'
  end

  def self.find(id)
    self.all[id]
  end

  def self.subclasses
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end

  protected

  attr_accessor :speed, :route, :current_station, :cars

  def validate!
    raise 'Train id should be a string' if id.class != String
    raise 'Train id has invalid format' if id !~ ID_FORMAT
    true
  end
end
