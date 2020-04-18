class Train
  include Company, InstanceCounter
  attr_accessor :speed, :carriages, :current_station
  attr_reader :type, :number, :route
  TYPES = ['PassengerTrain','CargoTrain']
  NUMBER_FORMAT = /[a-zа-я0-9]{3}-?[a-zа-я0-9]{2}$/i
  @@trains = []
  @@trains_hash = {}
  def initialize(number, type)
    @number = number
    @carriages = []
    @type = type
    validate!
    @speed = 0
    @@trains_hash.store(self.number, self)
    @@trains << self
    register_instance
  end
  
  def stop
    self.speed = 0
  end

  def add_carriage(carriage)
      raise "Нельзя прицеплять вагоны во время движения" if speed == 0
      self.carriages << carriage if carriage.type == self.type
  end

  def remove_carriage(carriage)
      raise "Нельзя отцеплять вагоны во время движения" if speed == 0
      self.carriages.delete(carriage)
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

  def valid?
    validate!
    true
    rescue 
    false
  end

  protected

  def validate!
    #Понимаю что эти типы должны создаваться в подклассе, но другой проверки не придумал.
    raise "Wrong type" if !TYPES.any?(type)
    raise "Wrong number format" if number !~ NUMBER_FORMAT
  end

end

