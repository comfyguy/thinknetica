class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def accept_train(train)
    trains << train
  end

  def dispatch_train(train)
    trains.delete(train)
  end

  def trains_list
    puts 'List of trains:'
    trains.each do |train|
      puts "Train #{train.number}. Cars: #{train.cars_amount}."
    end
  end

  def trains_by_type(type)
    puts "List of #{type} trains:"
    trains.each do |train|
      puts "Train #{train.number}." if train.class.type_of_train == type
    end
  end
end
