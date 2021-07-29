require './route.rb'
require './station.rb'

=begin
Класс Train (Поезд)

Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
Может набирать скорость
Может возвращать текущую скорость
Может тормозить (сбрасывать скорость до нуля)
Может возвращать количество вагонов
Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
Может принимать маршрут следования (объект класса Route).
При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
=end
class Train
  TYPE_PASSENGER = 'passenger'
  TYPE_FREIGHT = 'freight'

  TYPE_NAMES = {
    TYPE_PASSENGER => 'пассажирский',
    TYPE_FREIGHT => 'грузовой'
  }

  ACCELERATION_DELTA = 5

  attr_reader :number, :type, :speed, :carriage_count, :route, :station

  def initialize(number, type, carriage_count)
    @number = number
    @type = type
    @carriage_count = carriage_count
    @speed = 0
  end

  def accelerate
    @speed += ACCELERATION_DELTA
  end

  def stop
    @speed = 0
  end

  def add_carriage
    @carriage_count += 1 if speed.zero?
  end

  def remove_carriage
    @carriage_count -= 1 if speed.zero? && carriage_count > 0
  end

  def route=(route)
    if station then station.send_train self end
    @route = route
    @station = self.route.stations.first
    station.take_train self
  end

  def previous_station
    route.stations.index(station) > 0 ? route.stations[route.stations.index(station)-1] : nil
  end

  def next_station
    route.stations[route.stations.index(station)+1]
  end

  def current_station
    station
  end

  def move(forward=true)
    unless station then puts 'Error: Train should be on route'; return false end
    can_move_to = false
    if forward && (destination = next_station)
      can_move_to = destination
    elsif !forward && (destination = previous_station)
      can_move_to = destination
    end

    unless can_move_to then puts 'Error: There is no way further'; return false end
    station.send_train self
    @station = can_move_to
    station.take_train self
  end

end
