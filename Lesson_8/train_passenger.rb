# frozen_string_literal: true

# Class for passenger trains
class PassengerTrain < Train
  TYPE = 'PassengerTrain'
  def initialize(number, type = TYPE)
    super
  end
end
