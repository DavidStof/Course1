=begin
Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).
=end

vowels = %w(а е ё и о у ы э ю я)

result = {}

("а".."я").each_with_index {|char, idx| result[char] = idx+1 if vowels.include? char}

puts result
