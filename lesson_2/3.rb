numbers = [1]

loop do
  if numbers[-2].nil?
    numbers << numbers[-1]
  elsif numbers[-1] + numbers[-2] <= 100
    numbers << numbers[-1] + numbers[-2]
  else
    break
  end
end

puts numbers
