class Carriage
  
  include Company

  attr_reader :type, :volume, :loaded
   
  def initialize(type, volume)
    @type = type
    @volume = volume
    @loaded = 0
  end

  def load(volume)
    if @loaded + volume <= @volume 
      @loaded += volume
    else
      raise "В вагоне недостаточно места. На текущий момент занято #{@loaded}"
    end
  end

  def empty_volume
    @volume - @loaded
  end
  
  protected

  attr_writer :volume, :loaded

end
