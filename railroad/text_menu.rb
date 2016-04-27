class TextMenu

  def initialize
    @stations = {}
    @trains = {}
  end

  def run
    loop do
      puts '1. Create a station.'
      puts '2. Create a train'
      puts '3. Add cars to the train.'
      puts '4. Remove cars from the train.'
      puts '5. Accept a train at the station.'
      puts '6. Stations list.'
      puts '7. Trains list at the station.'
      puts '8. Exit'
      print 'Please enter number from 1 to 8: '
      input = gets.to_i
      case input
      when 1
        create_station(station_name)
      when 2
        create_train(train_type, train_number, cars_amount)
      when 3
       add_cars_to_train(train_number, cars_amount)
      when 4
        remove_cars_from_train(train_number, cars_amount)
      when 5
        accept_train_at_station(station_name, train_number)
      when 6
        stations_list
      when 7
        trains_at_station(station_name)
      when 8
        break
      end
    end
  end

  private

  attr_reader :stations, :trains

  def station_name
    print 'Enter station name: '
    gets.chomp
  end

  def train_number
    print 'Enter train number: '
    gets.chomp
  end

  def train_type
    puts "Select train type"
    Train::TYPES.each_with_index do |type, index|
      puts "#{index} - #{type[:type_name]}"
    end
    type = gets.to_i
  end

  def cars_amount
    print 'Enter amount of cars: '
    gets.to_i
  end

  def create_station(name)
    stations[name] = Station.new(name) if stations[name].nil?
  end

  def create_train(type, number, cars)
    if trains[number].nil?
      trains[number] = new_train(type, number, cars)
    end
  end

  def add_cars_to_train(number, cars)
    if trains[number]
      cars.times { trains[number].add_car(new_car(trains[number])) }
    end
  end

  def remove_cars_from_train(number, cars)
    cars.times { trains[number].remove_car } if trains[number]
  end

  def accept_train_at_station(name, number)
    stations[name].accept_train(trains[number]) if trains[number] && stations[name]
  end

  def stations_list
    stations.each_key { |name| puts name }
  end

  def trains_at_station(name)
    stations[name].trains_list if stations[name]
  end

  def new_car(train)
    Object.const_get(Train::TYPES[train.type][:car_class]).new
  end

  def new_train(type, number, cars)
    Object.const_get(Train::TYPES[type][:train_class]).new(number, cars)
  end
  
end
