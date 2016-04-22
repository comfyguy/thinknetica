puts 'Enter a side'
a = gets.to_f
puts 'Enter b side'
b =  gets.to_f
puts 'Enter c side'
c =  gets.to_f

def right?(a, b, c)
  max_side = [a, b, c].max
  a**2 + b**2 + c**2 - max_side**2 == max_side**2
end

def equilateral?(a, b, c)
  a == b && b == c
end

if is_equilateral?(a, b, c)
  puts 'This is a equilateral triangle'
elsif is_right?(a, b, c)
  puts 'This is right triangle'
end

unless is_equilateral?(a, b, c)
  puts 'This is isosceles triangle' if a == b || a == c || b == c
end
