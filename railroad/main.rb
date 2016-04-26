require_relative 'train'
require_relative 'passengertrain'
require_relative 'cargotrain'
require_relative 'passengercar'
require_relative 'cargocar'
require_relative 'station'
require_relative 'route'

stations = {}
trains = {}

def input_station_name
  print 'Enter station name: '
  gets.chomp
end

def input_train_number
  print 'Enter train registration number: '
  gets.chomp
end

def input_cars_amount
  print 'Enter amount of cars: '
  gets.to_i
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
    name = input_station_name
    stations[name] = Station.new(name) if stations[name].nil?
  when 2
    reg_number = input_train_number
    cars = input_cars_amount
    print 'Select train type (0 - cargo, 1 - passenger): '
    type = gets.to_i
    if trains[reg_number].nil?
      trains[reg_number] = CargoTrain.new(reg_number, cars) if type == 0
      trains[reg_number] = PassengerTrain.new(reg_number, cars) if type == 1
    end
  when 3
    reg_number = input_train_number
    cars = input_cars_amount
    cars.times { trains[reg_number].add_car }
  when 4
    reg_number = input_train_number
    cars = input_cars_amount
    cars.times { trains[reg_number].remove_car }
  when 5
    name = input_station_name
    reg_number = input_train_number
    stations[name].accept_train(trains[reg_number])
  when 6
    stations.each { |station| puts station.name }
  when 7
    name = input_station_name
    stations[name].trains_list
  when 8
    break
  end
end
