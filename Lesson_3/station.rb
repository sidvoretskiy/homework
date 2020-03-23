class Station

  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def accept(train)
    @trains << train
  end

  def list
    if @trains == nil or @trains == []
      puts 'На станции нет поездов'
    else
    @trains.each {|train| puts train}
    end
  end

  def list_with_type(type)
    if @trains.empty?
      puts 'На станции нет поездов'
    else
    @trains.each do |train|
       puts train.number if train.type == type
     end
    end
  end

  def send(train)
    @trains.delete(train)
  end

end
