class Station
  @@stations = []
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
  end

  def accept(train)
    @trains << train
  end

  def list
    if @trains.empty?
      puts 'На станции нет поездов'
    else
    @trains.each {|train| puts train}
    end
  end

  def list_names
    if @trains.empty?
      puts 'На станции нет поездов'
    else
    @trains.each {|train| puts train.number}
    end
  end

  def list_with_type(type)
    if @trains.empty?
      puts 'На станции нет поездов'
    else
      @trains.select {|train| train.type == type}
    end
  end

  def send(train)
    @trains.delete(train)
  end

  def self.stations
    @@stations
  end

  def self.stations_names
    @@stations.each_with_index {|station, index| puts "#{index + 1} - станция: #{station.name}"}
  end

end
