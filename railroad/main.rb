require_relative 'instances_storage'
require_relative 'instance_counter'
require_relative 'vendor'
require_relative 'input'
require_relative 'train'
require_relative 'car'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_car'
require_relative 'cargo_car'
require_relative 'station'
require_relative 'route'

require_relative 'text_menu'

menu = TextMenu.new
menu.run

def fill_cargo(i)
  arr = []
  i.times { arr << CargoCar.new(10) }
  arr
end

def fill_pass(i)
  arr = []
  i.times { arr << PassengerCar.new(10) }
  arr
end

def rand_cargo
  CargoTrain.new(rand(10_000..99_999).to_s, fill_cargo(rand(1..5)))
end

def rand_pass
  PassengerTrain.new(rand(10_000..99_999).to_s, fill_pass(rand(1..5)))
end

stations = [Station.new('MSK'), Station.new('SPB'), Station.new('EKB')]

stations.each do |station|
  station.accept_train(rand_cargo)
  station.accept_train(rand_pass)
  puts "Station ID: #{station.id}. Trains list:"
  puts '-------------------------'

  station.each_train do |train|
    puts "Train id: #{train.id}. Train type: #{train.class.type_of_train}. Cars list:"
    puts '-------------------------'
    menu.send :cars_list, train.id
    puts '-------------------------'
  end
end
