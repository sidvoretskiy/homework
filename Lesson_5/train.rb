class Train
  include Company, InstanceCounter
  attr_accessor :speed, :carriages, :current_station
  attr_reader :type, :number, :route
  @@trains = []
  @@trains_hash = {}
  def initialize(number, type)
    @number = number
    @carriages = []
    @type = type
    @speed = 0
    @@trains_hash.store(self.number, self)
    @@trains << self
    register_instance
  end
  
  def stop
    self.speed = 0
  end

  def add_carriage(carriage)
    if speed == 0
      self.carriages << carriage if carriage.type == self.type
    else 
      puts "Нельзя прицеплять вагоны во время движения"
    end
  end

  def remove_carriage(carriage)
    if speed == 0
      self.carriages.delete(carriage)
    else 
      puts "Нельзя отцеплять вагоны во время движения"
    end
  end

  def route=(route)
    @route = route
    route.first_station.accept(self)
    @current_station = route.first_station
  end

  def next_station
    @route.full_route[@route.full_route.find_index(@current_station) + 1] if !@route.last_station?(@current_station)
  end

  def previous_station
    @route.full_route[@route.full_route.find_index(@current_station) - 1] if !@route.first_station?(@current_station)
  end

  def move_next
    if next_station
      @current_station.send(self)
      @current_station = next_station 
      @current_station.accept(self)
    end
  end

  def move_back
    if previous_station
      @current_station.send(self)
      @current_station = previous_station
      @current_station.accept(self) 
    end
  end

  def self.trains
    @@trains
  end

  def self.trains_names
    @@trains.each_with_index {|train, index| puts "#{index + 1} - поезд: #{train.number}, тип: #{train.type}"}
  end

  def self.find(number)
    @@trains_hash[number]
  end

end

