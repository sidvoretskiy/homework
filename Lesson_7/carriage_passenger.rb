class PassengerCarriage < Carriage
  TYPE = 'PassengerTrain'
  def initialize(type = TYPE, volume)
    super
  end

  def load
    @loaded += 1
  end

end
