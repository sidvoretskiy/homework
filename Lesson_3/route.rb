class Route
  
  attr_reader :first_station, :last_station

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = []
  end

  def list
    puts @first_station.name
    @stations.each {|station| puts station.name} if @stations != nil
    puts @last_station.name
  end

  def add(station)
    @stations << station
  end

  def remove(station)
    @stations.delete(station)
  end

  def full_route
    full_route = []
    full_route << @first_station
    @stations.each {|station| full_route << station} if @stations != nil
    full_route << @last_station
  end

end
