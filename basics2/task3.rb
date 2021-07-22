=begin
Заполнить массив числами фибоначчи до 100
=end

my_array = [0, 1]
index = 2

loop do
  f = my_array[index-2] + my_array[index-1]
  break if f > 100
  my_array.push f
  index += 1
end

puts my_array.join ', '
