require_relative 'common_methods'
require_relative 'instance_counter'
require_relative 'vendor'
require_relative 'train'
require_relative 'car'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_car'
require_relative 'cargo_car'
require_relative 'station'
require_relative 'route'
require_relative 'text_menu'

TextMenu.new.run

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
  CargoTrain.new(rand(10000..99999).to_s, fill_cargo(rand(1..5)))
end  

def rand_pass
  PassengerTrain.new(rand(10000..99999).to_s, fill_pass(rand(1..5)))
end  

msk = Station.new('MSK')
spb = Station.new('SPB')
ekb = Station.new('EKB')

msk.accept_trains(rand_cargo, rand_pass)
spb.accept_trains(rand_cargo, rand_pass)
ekb.accept_trains(rand_cargo, rand_pass)

Station.foreach do |station|
  puts "Station ID: #{station.id}. Trains list:"
  puts '-------------------------'
  station.trains.each do |train|
    puts "Train id: #{train.id}. Train type: #{train.class.type_of_train}. Cars list:"
    puts '-------------------------'
    train.cars.each do |car|
      puts "Car id: #{car.id}. Type: passenger. Seats taken: #{car.seats_taken}. Free seats: #{car.free_seats} " if car.class == PassengerCar
      puts "Car id: #{car.id}. Type: cargo. Space used: #{car.space_used}. Free space: #{car.free_space} " if car.class == CargoCar
    end
    puts '-------------------------'
  end
end
