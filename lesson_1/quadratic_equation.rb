puts "Enter coefficients of the equation"
print "a? "
a = gets.to_f
print "b? "
b =  gets.to_f
print "c? "
c =  gets.to_f

d = b**2 - 4*a*c

if d < 0
	puts "There are no solutions."
elsif d == 0
	puts "There is one solution: x = #{-b / (2 * a) }"
elsif
	puts "There are two solutions: x1 = #{ (-b + Math.sqrt(d)) / (2 * a) } and x2 = #{ (-b - Math.sqrt(d)) / (2 * a) }"
end