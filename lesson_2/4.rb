vowels = %w(a e i o u y)
hash = {}

('a'..'z').each_with_index { |l, i| hash[l] = i + 1 if vowels.include?(l) }

puts hash
