module Input
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
  end

  module InstanceMethods
    private

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
  end
end
