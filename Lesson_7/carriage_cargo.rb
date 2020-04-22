class CargoCarriage < Carriage
  TYPE = 'CargoTrain'
  def initialize(type = TYPE, volume)
    super
  end

  def load(volume)
    if @loaded + volume <= @volume 
      @loaded += volume
    else
      raise "В вагоне недостаточно места. На текущий момент занято #{@volume}"
    end
  end

end
