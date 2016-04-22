alphabet = ('a'..'z').to_a

vowels = %w(a e i o u y)

hash = {}

vowels.each do |v|
  hash[v] = alphabet.index(v) + 1
end

puts hash
