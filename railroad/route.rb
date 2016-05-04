class Route

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
    validate!
  end

  def add_station(station)
    raise 'All route points should be a Station class objects' if station.class != Station
    stations.insert(-2, station)
  end

  def remove_station(station)
    if station != stations.first && station != stations.last
      stations.delete(station)
    else
      raise 'You can not delete start and end points of the route'
    end
  end

  def stations_list
    stations.each { |station| puts station.id }
  end

  def station(station_index)
    stations[station_index]
  end

  def valid?
    validate!
    rescue
    false    
  end

  private

  attr_reader :stations

  def validate!
    stations.each do |station|
    raise 'All route points should be a Station class objects' if station.class != Station
    end
    true
  end
end
