# frozen_string_literal: true

# Carriage for cargo
class CargoCarriage < Carriage
  TYPE = 'CargoTrain'
  def initialize(volume, type = TYPE)
    super
  end
end
