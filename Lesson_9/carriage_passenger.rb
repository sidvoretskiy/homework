# frozen_string_literal: true

# Carriage for passengers
class PassengerCarriage < Carriage
  TYPE = 'PassengerTrain'
  def initialize(volume, type = TYPE)
    super
  end

  def load
    @loaded += 1
  end
end
