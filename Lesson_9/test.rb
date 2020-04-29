# frozen_string_literal: true

require './company.rb'
require './instance_counter.rb'
require './accessors.rb'
require './validation.rb'
require './station.rb'
require './train.rb'
require './route.rb'
require './train_cargo.rb'
require './train_passenger.rb'
require './carriage.rb'
require './carriage_cargo.rb'
require './carriage_passenger.rb'

station1 = Station.new('Москва')
station2 = Station.new('Минск')
station3 = Station.new('Киев')
station4 = Station.new('Варшава')
station5 = Station.new('Таллин')

# pass1 = PassengerTrain.new('ПС-1')
# pass2 = PassengerTrain.new('ПС-2')
# cargo1 = CargoTrain.new('ГР-1')
# cargo2 = CargoTrain.new('ГР-2')

route1 = Route.new(station1, station5)
route1.add(station2)
route1.add(station3)
route1.add(station4)

pass1.route = route1
cargo1.route = route1

cargo_carriage1 = Carriage.new(100, 'CargoTrain')
# cargo_carriage1 = Carriage.new(100, 'CargoTrain')
pass_carriage1 = Carriage.new(54, 'PassengerTrain')
# pass_carriage2 = Carriage.new(54, 'PassengerTrain')

pass1.add_carriage(cargo_carriage1)
pass1.add_carriage(pass_carriage1)

# station1 = Station.new('Москва')
# station1.accept(cargo1)
# station1.accept(cargo2)
# station1.accept(pass1)
#
# station1.list_with_type('Пассажирский')
#
# puts station1
# puts station2
# puts station3
# puts station4
# puts station5
