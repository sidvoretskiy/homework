class Train
  
  attr_accessor :speed, :carriages, :current_station
  attr_reader :type, :number, :route

  def initialize(number, type, carriages)
    @number = number
    if  ['Грузовой','Пассажирский'].include?(type)
      @type = type
    else raise "Такой тип поездов не допускается"
    end
    @carriages = carriages
    @speed = 0
  end
  
  def stop
    self.speed = 0
  end

  def add_carrige
    if speed == 0
      self.carriages += 1
      puts 'done'
    else puts "Нельзя прицеплять вагоны во время движения"
    end
  end

  def remove_carrige
    if speed == 0
      self.carriages -= 1 if carriages > 0
    else puts "Нельзя отцеплять вагоны во время движения"
    end
  end

  def route=(route)
    @route = route
    route.first_station.accept(self)
    @current_station = route.first_station
  end

  def next_station
    current_station_index = @route.full_route.find_index(@current_station)
    if current_station_index == (@route.full_route.size - 1)
      nil
    else
      @route.full_route[current_station_index + 1]
    end
  end

  def previous_station
    current_station_index = @route.full_route.find_index(@current_station)
    if current_station_index == 0
      nil
    else
      @route.full_route[current_station_index - 1]
    end
  end

  def move_next
    if next_station != nil
      @current_station.send(self)
      @current_station = next_station 
      @current_station.accept(self)
    end
  end

  def move_back
    if previous_station != nil
      @current_station.send(self)
      @current_station = previous_station
      @current_station.accept(self) 
    end
  end

end

