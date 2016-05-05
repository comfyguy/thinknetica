class Station
  include CommonMethods

  attr_reader :id, :trains

  def initialize(id)
    @id = id
    @trains = []
    validate!
  end

  def accept_trains(*train)
    train.each { |train| trains << train }
  end

  def dispatch_trains(*train)
    train.each { |train| trains.delete(train) }
  end

  def trains_by_type(type)
    output = []
    trains.each do |train|
      output << train if train.class.type_of_train == type
    end
    output
  end

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise 'Station name should be a string' if id.class != String
    raise 'Station name should be at least 3 characters long' if id.length < 3
    true
  end
end
