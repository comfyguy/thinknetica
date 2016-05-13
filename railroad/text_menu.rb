class TextMenu
  include Input

  BLANK = '-----------------------------------'.freeze

  attr_reader :stations, :trains

  def run
    current_menu = menu.each_key.to_a
    loop do
      puts BLANK
      current_menu.each_with_index { |option, index| puts "#{index} - #{option}" }
      puts BLANK
      puts 'Please select one of these options:'
      input = gets.chomp.to_i
      puts BLANK
      menu[current_menu[input]].call
    end
  end

  def initialize
    @stations = {}
    @trains = {}
  end

  private

  def menu
    { 'Create a station.' => proc { create_station(station_id) },
      'Create a train' => proc { create_train(train_class, train_id, cars_amount) },
      'Add cars to the train.' => proc { add_cars_to_train(train_id, cars_amount) },
      'Remove cars from the train.' => proc { remove_cars_from_train(train_id, cars_amount) },
      'Accept a train at the station.' => proc { accept_train_at_station(station_id, train_id) },
      'Stations list.' => proc { stations_list },
      'Trains list at the station.' => proc { trains_at_station(station_id) },
      'Cars list.' => proc { cars_list(train_id) },
      'Load car.' => proc { load_car(car_id) },
      'Exit.' => proc { raise StopIteration }
    }
  end

  def create_station(id)
    stations[id] = Station.new(id) if stations[id].nil?
  rescue RuntimeError => e
    puts e.message
  end

  def create_train(type, id, cars)
    if trains[id].nil?
      trains[id] = type.new(id)
      add_cars_to_train(id, cars)
    end
  rescue RuntimeError => e
    puts e.message
  end

  def add_cars_to_train(id, cars)
    if trains[id]
      cars.times { trains[id].add_car(trains[id].class.type_of_car.new(max_capacity)) }
    end
  rescue RuntimeError => e
    puts e.message
  end

  def remove_cars_from_train(id, cars)
    cars.times { trains[id].remove_car } if trains[id]
  rescue RuntimeError => e
    puts e.message
  end

  def accept_train_at_station(station_id, train_id)
    stations[station_id].accept_train(trains[train_id]) if trains[train_id] && stations[station_id]
  rescue RuntimeError => e
    puts e.message
  end

  def stations_list
    stations.each_key { |id| puts id }
  end

  def trains_at_station(id)
    if stations[id]
      stations[id].each_train do |train|
        puts "Train id: #{train.id}. Train type: #{train.class.type_of_train}."
        puts " Amount of cars: #{train.cars_amount}."
      end
    end
  end

  def cars_list(id)
    raise "There is no train with id: #{id}" if Train.all[id].nil?
    Train.all[id].each_car do |car|
      if car.class == PassengerCar
        puts "Car id: #{car.id}. Type: passenger."
        puts "Seats taken: #{car.space_taken}. Free seats: #{car.free_space}."
      end
      if car.class == CargoCar
        puts "Car id: #{car.id}. Type: cargo."
        puts "Space used: #{car.space_taken}. Free space: #{car.free_space}."
      end
    end
  end

  def load_car(id)
    car = Car.all[id]
    raise "There is no car with id: #{id}." if car.nil?
    load_passenger(car) if car.class == PassengerCar
    load_cargo if car.class == CargoCar
  rescue RuntimeError => e
    puts e.message
  end

  def load_passenger(car)
    puts "This car has #{car.free_space} free seats."
    print 'How many seats you want to take?'
    gets.to_i.times { car.take_space }
    puts "Free seats after: #{car.free_space}. Seats taken: #{car.space_taken}."
  end

  def load_cargo(car)
    puts "This car has #{car.free_space} free space."
    print 'How much cargo you want to load?'
    car.take_space(gets.to_f)
    puts "Free space after #{car.free_space}. Space used: #{car.space_taken}."
  end
end
