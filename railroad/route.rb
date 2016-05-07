class Route

  attr_reader :stations

  def initialize(first, last)
    @stations = [first, last]
    validate!
  end

  def add_station(station)
    station_test(station)
    stations.insert(-2, station)
  end

  def remove_station(station)
    raise 'You can not delete start and end points of the route' unless\
    station != stations.first && station != stations.last
    stations.delete(station)
  end

  def stations_list
    stations.each { |station| puts station.id }
  end

  def valid?
    validate!
    rescue
    false    
  end

  private

  def validate!
    stations.each do |station|
      station_test(station)
    end
    true
  end

  def station_test!(station)
    raise 'All route points should be a Station class objects' unless station.is_a?(Station)
  end
end
