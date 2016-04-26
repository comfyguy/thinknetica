class Train
  TYPES = [:freight, :passenger].freeze

  attr_reader :type, :reg_number
  attr_accessor :speed, :route, :current_station, :cars

  def initialize(reg_number, type, cars)
    @reg_number = reg_number
    @type = type
    @speed = 0
    @cars = cars
  end

  def speed_up(increment)
    self.speed += increment
  end

  def current_speed
    puts "Current speed id #{speed}"
  end

  def stop
    self.speed = 0
  end

  def cars_amount
    puts "The train have #{cars} now."
  end

  def add_car
    if speed == 0
      self.cars += 1
    else
      puts 'Please stop train before adding cars.'
    end
  end

  def remove_car
    if speed == 0
      self.cars -= 1 unless cars == 0
    else
      puts 'Please stop train before removing cars.'
    end
  end

  def accept_route(train_route)
    self.route = train_route
    self.current_station = 0
  end

  def show_route
    return if route.nil?
    puts "Previous station was #{route.station[current_station - 1].name}"\
    unless current_station.zero?
    puts "Current station is #{route.station[current_station].name}"
    puts "Next station will be #{route.station[current_station + 1].name}"\
    unless route.station[current_station + 1].nil?
  end

  def go_forward
    self.current_station += 1 unless route.station[current_station + 1].nil?
  end

  def go_back
    self.current_station -= 1 unless current_station.zero?
  end
end
