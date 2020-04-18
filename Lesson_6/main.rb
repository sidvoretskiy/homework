require './instance_counter.rb'
require './company.rb'
require './station.rb'
require './train.rb'
require './route.rb'
require './train_cargo.rb'
require './train_passenger.rb'
require './carriage.rb'

#Данные для теста
station1 = Station.new('Москва')
station2 = Station.new('Минск')
station3 = Station.new('Киев')
station4 = Station.new('Варшава')
station5 = Station.new('Таллин')

route1 = Route.new(station1, station5)
route1.add(station2)
route1.add(station3)

pass1 = PassengerTrain.new('ППС-10')
pass2 = PassengerTrain.new('ППС-20')
cargo1 = CargoTrain.new('ПГР-10')
cargo2 = CargoTrain.new('ПГР-20')

x = 1
while x != 0
  puts '------------------------------------------------------------------------'
  puts '1 - Создавать станции'
  puts '2 - Создавать поезда'
  puts '3 - Создавать маршруты и управлять станциями в нем (добавлять, удалять)'
  puts '4 - Назначать маршрут поезду'
  puts '5 - Добавлять вагоны к поезду'
  puts '6 - Отцеплять вагоны от поезда'
  puts '7 - Перемещать поезд по маршруту вперед и назад'
  puts '8 - Просматривать список станций и список поездов на станции'
  puts '0 - Выход'
  puts '------------------------------------------------------------------------'
  x = gets.chomp.to_i
  case x
    when 1
      Station.stations_names
      puts 'Введите название новой станции'
      Station.new(gets.chomp)
      Station.stations_names
    when 2
      Train.trains_names
      create = false
      while create != true
        puts 'Введите название поезда'
        name = gets.chomp
        puts 'Введите тип поезда:'
        puts '1 - PassengerTrain'
        puts '2 - CargoTrain'
        type = gets.chomp.to_i
        begin
          case type
            when 1
              PassengerTrain.new(name)
            when 2
              CargoTrain.new(name)
          end
          create = true
        rescue RuntimeError => e
          puts "Неверный формат номера" 
        end
      end
      Train.trains_names
    when 3
      puts "1 - Создать маршрут"
      puts "2 - Добавить станцию к маршруту"
      puts "3 - Удалить станцию из маршрута"
      puts "0 - выход"
      case gets.chomp.to_i
        when 1
          Station.stations_names
          puts "Введите начальную станцию"
          first_station = gets.chomp.to_i
          puts "Введите конечную станцию"
          last_station = gets.chomp.to_i
          Route.new(Station.stations[first_station - 1], Station.stations[last_station - 1])
          Route.routes_names
        when 2
          Route.routes_names
          puts "Выберите маршурт"
          route = gets.chomp.to_i
          puts "Список станций маршрута #{Route.routes[route -1].name}:"
          Route.routes[route -1].stations_names
          puts "Выберите станцию для добавления:"
          Station.stations_names
          Route.routes[route -1].add(Station.stations[gets.chomp.to_i - 1])
          puts "Новый список станций маршрута #{Route.routes[route -1].name}:"
          Route.routes[route -1].stations_names
        when 3
          Route.routes_names
          puts "Выберите маршурт"
          route = gets.chomp.to_i
          puts "Список станций маршрута #{Route.routes[route -1].name}:"
          Route.routes[route -1].stations_names
          puts "Выберите станцию для удаления:"
          Route.routes[route -1].stations_names
          Route.routes[route -1].remove(Route.routes[route -1].stations[gets.chomp.to_i - 1])
          puts "Новый список станций маршрута #{Route.routes[route -1].name}:"
          Route.routes[route -1].stations_names
      end
    when 4
      Train.trains_names
      puts 'Выберите поезд'
      train = gets.chomp.to_i
      puts "Текущий маршут поезда: #{Train.trains[train - 1].route.name}" if Train.trains[train - 1].route
      Route.routes_names
      puts "Выберите маршурт"
      route = gets.chomp.to_i
      Train.trains[train - 1].route=(Route.routes[route - 1])
      puts "Новый маршут поезда: #{Train.trains[train - 1].route.name}"  
    when 5
      Train.trains_names
      puts 'Выберите поезд которому добавить вагон'
      train = gets.chomp.to_i
      Train.trains[train - 1].add_carriage(Carriage.new(Train.trains[train - 1].type))
      puts Train.trains[train - 1].carriages
    when 6
      Train.trains_names
      puts 'Выберите поезд у которого отцепить'
      train = gets.chomp.to_i
      Train.trains[train - 1].remove_carriage(Train.trains[train - 1].carriages[0]) if Train.trains[train - 1].carriages[0]
      puts Train.trains[train - 1].carriages
    when 7
      Train.trains_names
      puts 'Выберите поезд который будем двигать'
      train = gets.chomp.to_i
      if !Train.trains[train -1].route
        puts "Данному поезду не присвоен маршрут"
      else
        puts "Поезд находится на станции #{Train.trains[train -1].current_station.name}" 
        puts "Следующая станция #{Train.trains[train -1].next_station.name}" if Train.trains[train -1].next_station
        puts "Предыдущая станция #{Train.trains[train -1].previous_station.name}" if Train.trains[train -1].previous_station
        puts 'В каком направление двигаем поезд?'
        puts '1 - Вперед' if Train.trains[train -1].next_station
        puts '2 - Назад?' if Train.trains[train -1].previous_station
        case gets.chomp.to_i
        when 1
          Train.trains[train -1].move_next
        when 2
          Train.trains[train -1].move_back
        end
        puts "Теперь поезд находится на станции #{Train.trains[train -1].current_station.name}"
      end
    when 8
      Station.stations_names
      puts "Выберите станцию"
      station = gets.chomp.to_i
      puts "На этой станции следующие поезда:"
      Station.stations[station - 1].list_names
  end
end
