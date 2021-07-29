require './train.rb'

=begin
Класс Station(станция)

Имеет название, которое указывается при ее создании
Может принимать поезда (по одному за раз)
Может возвращать список всех поездов на станции, находящиеся в текущий момент
Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
=end
class Station
  attr_reader :title, :trains

  # Конструктор
  def initialize title
    @title = title
    @trains = {}
  end

  # Принятие поезда
  def take_train train
    @trains[train.number] = train
  end

  # Отправка поезда
  def send_train train
    @trains.delete train.number
  end

  # Поезда по типу
  def trains_by_type
    result = {Train::TYPE_PASSENGER => 0, Train::TYPE_FREIGHT => 0,}
    trains.each { |train| result[train.type] += 1 }
    result
  end

end
