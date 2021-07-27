=begin
Заполнить массив числами фибоначчи до 100
=end

my_array = [0, 1]

loop do
  f = my_array[-2] + my_array[-1]
  break if f > 100
  my_array << f
end

puts my_array.join ', '
