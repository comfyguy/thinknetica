class Station
  include InstancesStorage

  attr_reader :id, :trains

  def initialize(id)
    @id = id
    @trains = []
    validate!
    store_instance
  end

  def accept_train(train)
    raise 'Train is not valid' unless train.is_a?(Train)
    trains << train
  end

  def dispatch_train(train, station)
    raise 'Train is not valid' unless train.is_a?(Train)
    raise 'Station is not valid' unless station.is_a?(Station)
    trains.delete(train)
    station.accept_train(train)
  end

  def trains_by_type(type)
    raise 'Type should be a non empty string' unless type.is_a?(String) && !type.empty?
    output = []
    trains.each do |train|
      output << train if train.class.type_of_train == type
    end
    output
  end

  def each_train
    block_given? ? trains.each { |train| yield(train) } : trains
  end

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise 'Station name should be a non empty string' unless id.is_a?(String) && !id.empty?
    true
  end
end
