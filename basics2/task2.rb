=begin
Заполнить массив числами от 10 до 100 с шагом 5
=end

my_array = []
n=10
while n <= 100 do
  my_array << n
  n += 5
end

puts my_array
