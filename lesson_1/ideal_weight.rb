puts 'What is your name?'
name = gets.chomp.capitalize

puts 'How tall are you?'
height = gets.to_i

optimal_weight = height - 110

if optimal_weight <= 0
  puts "#{name}, you are already at your optimal weight."
else
  puts "#{name}, your ideal body weight is #{optimal_weight} kilograms."
end
