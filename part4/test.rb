Dir['./*.rb'].each { |file| require file if file != './test.rb' }

train1 = Train.new('Поезд 1', Train::TYPE_PASSENGER, 8)
train2 = Train.new('Поезд 2', Train::TYPE_FREIGHT, 80)

station1 = Station.new('Станция 1')
station2 = Station.new('Станция 2')
station3 = Station.new('Станция 3')
station4 = Station.new('Станция 4')
station5 = Station.new('Станция 5')

route1 = Route.new(station1, station5)
route2 = Route.new(station2, station4)

puts "Назначаем поезду #{train1.number} маршрут #{route1.to_s}"
train1.route = route1
puts "#{Train::TYPE_NAMES[train1.type].capitalize} поезд #{train1.number} из #{train1.carriage_count} вагонов на станции #{train1.current_station.title}"
puts "---\n"

puts "Добавляем вагончик до станции #{station4.title}"
train1.add_carriage
puts "Вносим в маршрут станцию #{station2.title}"
route1.add_station station2
puts "#{Train::TYPE_NAMES[train1.type].capitalize} поезд #{train1.number} из #{train1.carriage_count} вагонов на станции #{train1.current_station.title} следует по маршруту #{train1.route.to_s}"
puts "---\n"

puts "Поезд #{train1.number} отправляется, следующая станция: #{train1.next_station.title}"
puts "Скорость #{train1.speed}"
train1.accelerate
puts "Скорость #{train1.speed}"
train1.accelerate
puts "Скорость #{train1.speed}"
train1.accelerate
puts "Скорость #{train1.speed}"
puts "---\n"

puts "Прибываем на станцию #{train1.next_station.title}"
train1.move
puts "Тормозим"
train1.stop
puts "Скорость #{train1.speed}"
puts "Прибыли на станцию #{train1.station.title}"
puts "---\n"

puts "Отцепляем вагончик от поезда #{train1.number}"
train1.remove_carriage
puts "Назначаем поезду #{train2.number} из #{train2.carriage_count} вагонов маршрут #{route2.to_s}"
train2.route = route2
puts "Цепляем вагончик к поезду #{train2.number}"
train2.add_carriage
puts "Теперь в поезде #{train2.number} #{train2.carriage_count} вагон(ов)"
puts "---\n"

puts "На станции #{station2.title} сейчас находятся #{station2.trains.count} поезд(а): "
station2.trains.each {|n, t|  puts t.number}
puts "---\n"
puts "Поезд #{train2.number} уехал"
train2.move
puts "---\n"

puts "На станции #{station2.title} сейчас находятся #{station2.trains.count} поезд(а): "
station2.trains.each {|n, t|  puts t.number}
puts "---\n"

puts "#{Train::TYPE_NAMES[train1.type].capitalize} поезд #{train1.number} из #{train1.carriage_count} вагонов на станции #{train1.current_station.title} следует по маршруту #{train1.route.to_s}"
puts "Следующая станция #{train1.next_station.title}"
puts "---\n"

puts "#{Train::TYPE_NAMES[train2.type].capitalize} поезд #{train2.number} из #{train2.carriage_count} вагонов на станции #{train2.current_station.title} следует по маршруту #{train2.route.to_s}"
puts "Предыдущая станция #{train2.previous_station.title}"
puts "---\n"
