require_relative 'train'
require_relative 'passengertrain'
require_relative 'cargotrain'
require_relative 'passengercar'
require_relative 'cargocar'
require_relative 'station'
require_relative 'route'

stations = []
trains = []

def train_by_number(reg_number, trains)
  trains.each do |train|
    return train if train.reg_number == reg_number
  end
  nil
end

def station_by_name(name, stations)
  stations.each do |station|
    return station if station.name == name
  end
  nil
end

def get_station_name
  print 'Enter station name: '
  gets.chomp
end

def get_train_number
  print 'Enter train registration number: '
  reg_number = gets.chomp
end

def get_cars_amount
  print 'Enter amount of cars: '
  cars = gets.to_i
end

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
      name = get_station_name
      stations << Station.new(name) if station_by_name(name,stations).nil?
    when 2
      reg_number = get_train_number
      cars = get_cars_amount
      print 'Select train type (0 - cargo, 1 - passenger): '
      type = gets.to_i
      if train_by_number(reg_number, trains).nil?
        trains << (CargoTrain.new(reg_number, cars)) if type == 0
        trains << PassengerTrain.new(reg_number, cars) if type == 1
      end
    when 3
      reg_number = get_train_number
      cars = get_cars_amount
      cars.times { train_by_number(reg_number, trains).add_car }
    when 4
      reg_number = get_train_number
      cars = get_cars_amount
      cars.times { train_by_number(reg_number, trains).remove_car }
    when 5
      name = get_station_name
      reg_number = get_train_number
      station_by_name(name, stations).accept_train(train_by_number(reg_number, trains))
    when 6
      stations.each { |station| puts station.name }
    when 7
      name = get_station_name
      station_by_name(name, stations).trains_list
    when 8
      break
  end
end
