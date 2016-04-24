class Route
  attr_reader :stations

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def remove_station(station)
    if station != stations.first && station != stations.last
      stations.delete(station)
    else
      puts 'You can not delete start and end points of the route.'
    end
  end

  def stations_list
    stations.each { |station| puts station.name }
  end
end
