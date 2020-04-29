# frozen_string_literal: true

# Main class for trains
class Train
  include InstanceCounter
  include Company
  extend Accessors
  include Validation
  attr_accessor :speed, :carriages
  attr_reader :type, :number, :route

  attr_accessor_with_history :current_station
  strong_attr_accessor :speed, Integer

  NUMBER_FORMAT = /[a-zа-я0-9]{3}-?[a-zа-я0-9]{2}$/i.freeze

  validate :number, :format, NUMBER_FORMAT

  @@trains = []
  @@trains_hash = {}
  def initialize(number, type)
    @number = number
    @carriages = []
    @type = type
    validate!
    @speed = 0
    @@trains_hash[self.number] = self
    @@trains << self
    register_instance
  end

  def stop
    self.speed = 0
  end

  def add_carriage(carriage)
    raise 'Нельзя прицеплять вагоны во время движения' if speed != 0

    carriages << carriage if carriage.type == type
  end

  def remove_carriage(carriage)
    raise 'Нельзя отцеплять вагоны во время движения' if speed != 0

    carriages.delete(carriage)
  end

  def route=(route)
    @route = route
    route.first_station.accept(self)
    @current_station = route.first_station
  end

  def next_station
    return if @route.last_station?(@current_station)

    @route.full_route[@route.full_route.find_index(@current_station) + 1]
  end

  def previous_station
    return if @route.first_station?(@current_station)

    @route.full_route[@route.full_route.find_index(@current_station) - 1]
  end

  def move_next
    return unless next_station

    @current_station.send(self)
    @current_station = next_station
    @current_station.accept(self)
  end

  def move_back
    return unless previous_station

    @current_station.send(self)
    @current_station = previous_station
    @current_station.accept(self)
  end

  def self.trains
    @@trains
  end

  def self.trains_names
    @@trains.each_with_index do |train, index|
      puts "#{index + 1} - поезд: #{train.number}, тип: #{train.type}"
    end
  end

  def self.find(number)
    @@trains_hash[number]
  end

  def carriage_block
    @carriages.each_with_index { |carriage, index| yield(carriage, index) }
  end
end
