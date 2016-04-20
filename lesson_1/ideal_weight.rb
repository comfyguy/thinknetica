puts "What is your name?"
name = gets.chomp.capitalize

puts "How tall are you?"
height = gets.to_i

if height - 110 <= 0 
	puts "#{name}, you are already at your optimal weight."
else
	puts "#{name}, your ideal body weight is #{height-110} kilograms."
end