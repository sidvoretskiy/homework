class Route
  include InstanceCounter, Validator
  include Validator
  @@routes = []
  attr_reader :first_station, :last_station, :stations

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    validate!
    @stations = []
    @@routes << self
    register_instance
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

  def full_route_names
    full_route.each_with_index {|station, index| puts "#{index + 1} - станция: #{station.name}"}
  end

  def stations_names
    @stations.each_with_index {|station, index| puts "#{index + 1} - станция: #{station.name}"}
  end

  def first_station?(current_station)
    self.full_route.find_index(current_station) == 0
  end

  def last_station?(current_station)
    self.full_route.find_index(current_station) == self.full_route.size - 1
  end

  def name
    "#{self.first_station.name} - #{self.last_station.name}"
  end

  def self.routes
    @@routes
  end

  def self.routes_names
    @@routes.each_with_index {|route, index| puts "#{index + 1} - маршурт: #{route.name}"}
  end

  protected

  def validate!
    raise "Object is not a station" if first_station.class != Station && last_station.class != Station
  end

end
