numbers = [1, 1]

fibon = 2

while fibon <= 100
  numbers << fibon
  fibon = numbers[-1] + numbers[-2]
end

puts numbers
