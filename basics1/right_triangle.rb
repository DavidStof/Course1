=begin
Прямоугольный треугольник. 
Программа запрашивает у пользователя 3 стороны треугольника и определяет, 
является ли треугольник прямоугольным (используя теорему Пифагора www-formula.ru), 
равнобедренным (т.е. у него равны любые 2 стороны) или 
равносторонним (все 3 стороны равны) и выводит результат на экран. 
Подсказка: чтобы воспользоваться теоремой Пифагора, 
нужно сначала найти самую длинную сторону (гипотенуза) 
и сравнить ее значение в квадрате с суммой квадратов двух остальных сторон. 
Если все 3 стороны равны, то треугольник равнобедренный и равносторонний, но не прямоугольный.
=end

sides = []
puts "Введите длину первой стороны треугольника"
sides.push Float(gets.chomp)

puts "Введите длину второй стороны треугольника"
sides.push Float(gets.chomp)

puts "Введите длину третьей стороны треугольника"
sides.push Float(gets.chomp)

longest = sides.sort![2]

accuracy = 0.001 # Предел точности для прямоугольного треугольника
is_right_triangle = (longest**2 - (sides[0]**2 + sides[1]**2)).abs < accuracy

if longest > sides[0] + sides[1]
  puts "Это невероятный треугольник"
elsif sides[0] == sides[1] && sides[1] == sides[2]
  puts "Это равносторонний треугольник"
elsif sides[0] == sides[1] || sides[0] == sides[2] || sides[1] == sides[2]
  puts "Это равнобедренный треугольник"
  puts "и прямоугольный" if is_right_triangle
elsif is_right_triangle
  puts "Это прямоугольный треугольник"
else
  puts "Это непримечательный треугольник"
end