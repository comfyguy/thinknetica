puts 'Enter coefficients of the equation'
print 'a? '
a = gets.to_f
print 'b? '
b = gets.to_f
print 'c? '
c = gets.to_f

d = b**2 - 4 * a * c

if d < 0
  puts 'There are no solutions.'
elsif d == 0
  puts "There is one solution: x = #{-b / (2 * a)}"
else
  x1 = (-b + Math.sqrt(d)) / (2 * a)
  x2 = (-b - Math.sqrt(d)) / (2 * a)
  puts "There are two solutions: x1 = #{x1} and x2 = #{x2}"
end
