class TextMenu

  def initialize
    @stations = {}
    @trains = {}
  end

  def run
    loop do
      puts '---------------------------------'
      puts '1. Create a station.'
      puts '2. Create a train'
      puts '3. Add cars to the train.'
      puts '4. Remove cars from the train.'
      puts '5. Accept a train at the station.'
      puts '6. Stations list.'
      puts '7. Trains list at the station.'
      puts '8. Cars list.'
      puts '9. Load car.'
      puts '10. Exit'
      print 'Please enter number from 1 to 10: '
      input = gets.to_i
      puts '---------------------------------'
      case input
      when 1
        create_station(station_id)
      when 2
        create_train(train_class, train_id, cars_amount)
      when 3
       add_cars_to_train(train_id, cars_amount)
      when 4
        remove_cars_from_train(train_id, cars_amount)
      when 5
        accept_train_at_station(station_id, train_id)
      when 6
        stations_list
      when 7
        trains_at_station(station_id)
      when 8
        show_cars(train_id)
      when 9
        load_car(car_id)
      when 10
        break
      end
    end
  end

  private

  attr_reader :stations, :trains

  def station_id
    print 'Enter station name: '
    gets.to_s.chomp
  end

  def car_id
    print 'Enter car id: '
    gets.chomp.to_i
  end

  def train_id
    print 'Enter train id: '
    gets.to_s.chomp
  end

  def train_class
    loop do
      puts 'Enter train type (1 - Passenger, 2 - Cargo):'
      input = gets.to_i
      return PassengerTrain if input == 1
      return CargoTrain if input == 2
    end
  end

  def cars_amount
    print 'Enter amount of cars: '
    gets.to_i
  end

  def max_capacity
    print 'Enter max capacity of car: '
    gets.to_i
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
    stations[station_id].accept_train(trains[train_id])\
     if trains[train_id] && stations[station_id]
  rescue RuntimeError => e
    puts e.message
  end

  def stations_list
    stations.each_key { |id| puts id }
  end

  def trains_at_station(id)
    stations[id].each_train do |train|
    puts "Train id: #{train.id}. Train type: #{train.class.type_of_train}. Amount of cars: #{train.cars_amount}"\
     if stations[id]
   end
  end

  def show_cars(id)
    if Train.all[id]
      Train.all[id].each_car do |car|
        puts "Car id: #{car.id}. Type: passenger. Seats taken: #{car.space_taken}. Free seats: #{car.free_space} "\
        if car.class == PassengerCar
        puts "Car id: #{car.id}. Type: cargo. Space used: #{car.space_taken}. Free space: #{car.free_space} "\
        if car.class == CargoCar
      end
    else
      puts "There is no train with id: #{id}"
    end
  end

  def load_car(id)
    car = Car.all[id]
    if car
      if car.class == PassengerCar
        puts "This car has #{car.free_space} free seats."
        print 'How many seats you want to take?'
        gets.to_i.times { car.take_space }
        puts "Free seats after: #{car.free_space}. Seats taken: #{car.space_taken}."
      end
      if car.class == CargoCar
        puts "This car has #{car.free_space} free space."
        print 'How much cargo you want to load?'
        car.take_space(gets.to_f)
        puts "Free space after #{car.free_space}. Space used: #{car.space_taken}."
      end
    else
      puts "There is no car with id: #{id}."
    end
  rescue RuntimeError => e
    puts e.message
  end

end
