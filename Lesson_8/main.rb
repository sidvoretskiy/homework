# frozen_string_literal: true

# Main menu
require './instance_counter.rb'
require './validator.rb'
require './company.rb'
require './station.rb'
require './train.rb'
require './route.rb'
require './train_cargo.rb'
require './train_passenger.rb'
require './carriage.rb'
require './carriage_cargo.rb'
require './carriage_passenger.rb'

# Test data
Station.new('Варшава')

route1 = Route.new(Station.new('Москва'), Station.new('Таллин'))
route1.add(Station.new('Минск'))
route1.add(Station.new('Киев'))

PassengerTrain.new('ППС-10')
PassengerTrain.new('ППС-20')
CargoTrain.new('ПГР-10')
CargoTrain.new('ПГР-20')

x = 1
while x != 0
  puts '------------------------------------------------------------------------'
  puts '1 - Создавать станции'
  puts '2 - Создавать поезда'
  puts '3 - Создавать маршруты и управлять станциями в нем (добавлять, удалять)'
  puts '4 - Назначать маршрут поезду'
  puts '5 - Поезда и вагоны'
  # puts '6 - Отцеплять вагоны от поезда'
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
      rescue RuntimeError
        puts 'Неверный формат номера'
      end
    end
    Train.trains_names
  when 3
    puts '1 - Создать маршрут'
    puts '2 - Добавить станцию к маршруту'
    puts '3 - Удалить станцию из маршрута'
    puts '0 - выход'
    case gets.chomp.to_i
    when 1
      Station.stations_names
      puts 'Введите начальную станцию'
      first_station = gets.chomp.to_i
      puts 'Введите конечную станцию'
      last_station = gets.chomp.to_i
      Route.new(Station.stations[first_station - 1], Station.stations[last_station - 1])
      Route.routes_names
    when 2
      Route.routes_names
      puts 'Выберите маршурт'
      route = gets.chomp.to_i
      puts "Список станций маршрута #{Route.routes[route - 1].name}:"
      Route.routes[route - 1].stations_names
      puts 'Выберите станцию для добавления:'
      Station.stations_names
      Route.routes[route - 1].add(Station.stations[gets.chomp.to_i - 1])
      puts "Новый список станций маршрута #{Route.routes[route - 1].name}:"
      Route.routes[route - 1].stations_names
    when 3
      Route.routes_names
      puts 'Выберите маршурт'
      route = gets.chomp.to_i
      puts "Список станций маршрута #{Route.routes[route - 1].name}:"
      Route.routes[route - 1].stations_names
      puts 'Выберите станцию для удаления:'
      Route.routes[route - 1].stations_names
      Route.routes[route - 1].remove(Route.routes[route - 1].stations[gets.chomp.to_i - 1])
      puts "Новый список станций маршрута #{Route.routes[route - 1].name}:"
      Route.routes[route - 1].stations_names
    end
  when 4
    Train.trains_names
    puts 'Выберите поезд'
    train = gets.chomp.to_i
    if Train.trains[train - 1].route
      puts "Текущий маршут поезда: #{Train.trains[train - 1].route.name}"
    end
    Route.routes_names
    puts 'Выберите маршурт'
    route = gets.chomp.to_i
    Train.trains[train - 1].route = Route.routes[route - 1]
    puts "Новый маршут поезда: #{Train.trains[train - 1].route.name}"
  when 5
    Train.trains_names
    puts 'Выберите поезд'
    train = gets.chomp.to_i
    puts 'Список вагонов поезда' if Train.trains[train - 1].carriages != []
    Train.trains[train - 1].carriage_block do |zz, index|
      puts "Вагон №:#{index + 1} - вместительность #{zz.volume}"
    end
    puts '1 - Добавить вагон'
    puts '2 - Удалить вагон'
    puts '3 - Загрузить вагон'
    case gets.chomp.to_i
    when 1
      puts 'Какой размер вагона?'
      volume = gets.chomp.to_i
      if Train.trains[train - 1].class == CargoTrain
        Train.trains[train - 1].add_carriage(CargoCarriage.new(volume))
      end
      if Train.trains[train - 1].class == PassengerTrain
        Train.trains[train - 1].add_carriage(PassengerCarriage.new(volume))
      end
      if Train.trains[train - 1].class == Train
        Train.trains[train - 1].add_carriage(Cargo.new(volume, Train.trains[train - 1].type))
      end
      Train.trains[train - 1].carriage_block do |zz, index|
        puts "Вагон №:#{index + 1}, тип: #{zz.class} - вместительность #{zz.volume}"
      end
    when 2
      puts 'Какой вагон удалить?'
      carriage = gets.chomp.to_i
      if Train.trains[train - 1].carriages[0]
        Train.trains[train - 1].remove_carriage(Train.trains[train - 1].carriages[carriage - 1])
      end
      Train.trains[train - 1].carriage_block do |zz, index|
        puts "Вагон №:#{index + 1}, тип: #{zz.class} - вместительность #{zz.volume}"
      end
    when 3
      Train.trains[train - 1].carriage_block do |zz, index|
        puts "Вагон №:#{index + 1}, тип: #{zz.class} - вместительность #{zz.volume},
              занято: #{zz.loaded}"
      end
      puts 'В какой вагон загружаем?'
      carriage = gets.chomp.to_i
      if Train.trains[train - 1].class == CargoTrain
        puts 'Какой объем загрузить?'
        volume = gets.chomp.to_i
        Train.trains[train - 1].carriages[carriage - 1].load(volume)
      else
        Train.trains[train - 1].carriages[carriage - 1].load
      end
    end
    Train.trains[train - 1].carriage_block do |zz, index|
      puts "Вагон №:#{index + 1}, тип: #{zz.class} - вместительность #{zz.volume},
            занято: #{zz.loaded}"
    end
  when 7
    Train.trains_names
    puts 'Выберите поезд который будем двигать'
    train = gets.chomp.to_i
    if !Train.trains[train - 1].route
      puts 'Данному поезду не присвоен маршрут'
    else
      puts "Поезд находится на станции #{Train.trains[train - 1].current_station.name}"
      if Train.trains[train - 1].next_station
        puts "Следующая станция #{Train.trains[train - 1].next_station.name}"
      end
      if Train.trains[train - 1].previous_station
        puts "Предыдущая станция #{Train.trains[train - 1].previous_station.name}"
      end
      puts 'В каком направление двигаем поезд?'
      puts '1 - Вперед' if Train.trains[train - 1].next_station
      puts '2 - Назад?' if Train.trains[train - 1].previous_station
      case gets.chomp.to_i
      when 1
        Train.trains[train - 1].move_next
      when 2
        Train.trains[train - 1].move_back
      end
      puts "Теперь поезд находится на станции #{Train.trains[train - 1].current_station.name}"
    end
  when 8
    Station.stations_names
    puts 'Выберите станцию'
    station = gets.chomp.to_i
    puts 'На этой станции следующие поезда:'
    Station.stations[station - 1].trains_block do |train_on_station, _index|
      puts "Номер поезда: #{train_on_station.number}, тип: #{train_on_station.type},
            кол-во вагонов: #{train_on_station.carriages.size}"
    end

  end
end
