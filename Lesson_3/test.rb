load './station.rb'
load './train.rb'
load './route.rb'

station1 = Station.new('Москва')
station2 = Station.new('Минск')
station3 = Station.new('Киев')
station4 = Station.new('Варшава')
station5 = Station.new('Таллин')

train1 = Train.new('ПС-1','Пассажирский',10)
train2 = Train.new('ПС-2','Пассажирский',25)
train3 = Train.new('ГР-1','Грузовой',50)
train4 = Train.new('ГР-2','Грузовой',78)

route1 = Route.new(station1, station5)
route1.add(station2)
route1.add(station3)
route1.add(station4)

train1.route=(route1)



station1 = Station.new('Москва')
station1.accept(train1)
station1.accept(train2)
station1.accept(train3)

station1.list_with_type('Пассажирский')

puts station1
puts station2
puts station3
puts station4
puts station5
