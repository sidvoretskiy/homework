class Route
  
  attr_reader :first_station, :last_station

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = []
  end

  def list
    puts @first_station.name
    @stations.each {|station| puts station.name}
    puts @last_station.name
  end

  def add(station)
    @stations << station
  end

  def remove(station)
    @stations.delete(station)
  end

  def full_route
    [@first_station, @stations, @last_station].flatten
  end

  def first_station?(current_station)
    self.full_route.find_index(current_station) == 0
  end

  def last_station?(current_station)
    self.full_route.find_index(current_station) == self.full_route.size - 1
  end

end
