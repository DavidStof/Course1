require './station.rb'

=begin
Класс Route(Маршрут)

Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
Может добавлять промежуточную станцию в список
Может удалять промежуточную станцию из списка
Может выводить список всех станций по-порядку от начальной до конечной
=end
class Route
  attr_reader :stations

  # Конструктор
  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  # Добавить станцию в маршрут перед конечной либо после станции after
  def add_station(station, after=nil)
    pos = after && stations.include?(after) ? stations.find_index(after) : stations.count-1
    stations.insert(pos, station)
  end

  # Удалить станцию из маршрута
  def remove_station(station)
    stations.delete station if station != stations.first && station != stations.last
  end

  # Список станций
  def stations_list
    stations.map { |station| station.title }
  end

  def to_s
    stations_list.join ' - '
    #@stations.join ' - '
  end
end
