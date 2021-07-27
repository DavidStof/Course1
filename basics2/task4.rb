=begin
Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).
=end

alphabet = ("а".."я")
vowels = %w(а е ё и о у ы э ю я)

result = {}

alphabet.each_with_index do |char, idx|
  idx += 1
  result[char] = idx if vowels.include? char
end

puts result
