# frozen_string_literal: true

# Carriage class
class Carriage
  include Company

  attr_reader :type, :volume, :loaded

  def initialize(volume, type)
    @type = type
    @volume = volume
    @loaded = 0
  end

  def load(volume)
    raise "В вагоне недостаточно места. На текущий момент занято #{@loaded}" unless volume <= empty_volume

    @loaded += volume
  end

  def empty_volume
    @volume - @loaded
  end

  protected

  attr_writer :volume, :loaded
end
