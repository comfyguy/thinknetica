class Train

  TYPES = [{ :type_name => 'cargo', :train_class => 'CargoTrain', :car_class => 'CargoCar' },
          { :type_name => 'passenger', :train_class => 'PassengerTrain', :car_class => 'PassengerCar' }].freeze

  #Все эти методы являются интерфейсом класса/подклассов, поэтому они - паблик

  attr_reader :number, :type

  def initialize(number, cars)
    @number = number
    @speed = 0
    @cars = []
    cars.times { add_car(self.car_class.new) }
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

  def add_car(car)
    if car.class == car_class && speed.zero?
      cars << car
    end
  end

  def remove_car
    cars.delete_at(-1) if speed.zero? && cars.size > 0
  end

  def car_class
    Object.const_get(Train::TYPES[type][:car_class])
  end

  protected

#Геттеры и сеттеры используются внутри класса/подклассов

  attr_accessor :speed, :route, :current_station, :cars

end
