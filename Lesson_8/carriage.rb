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
    unless volume <= empty_volume
      raise "В вагоне недостаточно места. На текущий момент занято #{@loaded}"
    end

    @loaded += volume
  end

  def empty_volume
    @volume - @loaded
  end

  protected

  attr_writer :volume, :loaded
end
