class Train
  protected

#Геттеры и сеттеры используются внутри класса/подклассов

  attr_accessor :speed, :route, :current_station, :cars

  public

#Все остальные методы являются интерфейсом класса/подклассов, поэтому они - паблик

  TYPES = [:cargo, :passenger].freeze

  attr_reader :reg_number, :type

  def initialize(reg_number)
    @reg_number = reg_number
    @speed = 0
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
    puts cars.size
  end

  def accept_route(train_route)
    self.route = train_route
    self.current_station = 0
  end

  def show_route
    return if route.nil?
    puts "Previous station was #{route.station(current_station - 1).name}"\
    unless current_station.zero?
    puts "Current station is #{route.station(current_station).name}"
    puts "Next station will be #{route.station(current_station + 1).name}"\
    unless route.station(current_station + 1).nil?
  end

  def go_forward
    self.current_station += 1 unless route.station(current_station + 1).nil?
  end

  def go_back
    self.current_station -= 1 unless current_station.zero?
  end

  def add_car
  end

  def remove_car
    cars.delete_at(-1) if speed.zero? && cars > 0
  end
end
