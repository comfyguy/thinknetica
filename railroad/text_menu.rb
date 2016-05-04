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
      print 'Please enter digit from 1 to 8: '
      input = gets.to_i
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

  def train_id
    print 'Enter train id: '
    gets.to_s.chomp
  end

  def train_class
    loop do
      puts 'Enter train type: '
      Train.subclasses.each_with_index { |val,index| puts "#{index} - #{val}" }
      input = gets.to_i
      if Train.subclasses[input]
        return Train.subclasses[input]
      end
    end
  end

  def cars_amount
    print 'Enter amount of cars: '
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
      cars.times { trains[id].add_car(trains[id].class.type_of_car.new) }
    end
  end

  def remove_cars_from_train(id, cars)
    cars.times { trains[id].remove_car } if trains[id]
  end

  def accept_train_at_station(station_id, train_id)
    stations[station_id].accept_train(trains[train_id])\
    if trains[train_id] && stations[station_id]
  end

  def stations_list
    stations.each_key { |id| puts id }
  end

  def trains_at_station(id)
    stations[id].trains_list.each { |train| puts \
    "Train id: #{train.id} with #{train.cars_amount} car(s)." } if stations[id]
  end
end
