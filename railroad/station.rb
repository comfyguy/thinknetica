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
      puts "Train #{train.number}."
    end
  end

  def trains_by_type(type)
    puts "List of #{Train::TYPES[type][:type_name]} trains:"
    trains.each do |train|
      puts "Train #{train.number}." if train.type == type
    end
  end
end
