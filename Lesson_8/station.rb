# frozen_string_literal: true

# Class for stations
class Station
  include Validator
  include InstanceCounter
  @stations = []
  attr_reader :name
  NAME_FORMAT = /[a-zа-я]+/i.freeze

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@stations << self
    register_instance
  end

  def all
    @@stations
  end

  def accept(train)
    @trains << train
  end

  def list
    if @trains.empty?
      puts 'На станции нет поездов'
    else
      @trains.each { |train| puts train }
    end
  end

  def list_names
    raise 'На станции нет поездов' if @trains.empty?

    @trains.each { |train| puts train.number }
  end

  def list_with_type(type)
    raise 'На станции нет поездов' if @trains.empty?

    @trains.select { |train| train.type == type }
  end

  def send(train)
    @trains.delete(train)
  end

  def self.stations
    @@stations
  end

  def self.stations_names
    @@stations.each_with_index { |station, index| puts "#{index + 1} - станция: #{station.name}" }
  end

  def trains_block
    @trains.each_with_index { |station, index| yield(station, index) }
  end

  protected

  def validate!
    raise 'Name should have a letter' if name !~ NAME_FORMAT
  end
end
