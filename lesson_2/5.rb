def leap?(year)
  (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
end

def yday(day, month, year)
  days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  days[1] = 29 if leap?(year)
  yday = 0
  for i in 1...month
    yday += days[i - 1]
  end
  yday + day
end

print 'Enter day '
day = gets.to_i
print 'Enter number of month '
month = gets.to_i
print 'Enter year '
year = gets.to_i

puts "This is #{yday(day, month, year)} day of year."
