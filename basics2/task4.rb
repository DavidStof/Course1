=begin
Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).
=end

alphabet = 'абвгдеёжзийклмнопрстуфхцчшщъыьэюя'
vowels = 'аеёиоуыэюя'

result = Hash.new

idx = 0
alphabet.each_char do |char|
  idx += 1
  vowels.each_char do |vowel|
    result[vowel] = idx if char == vowel
  end
end

puts result
