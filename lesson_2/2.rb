numbers = []

index = 10

loop do
  numbers << index
  if index >= 100
    puts index
    break
  else
    print "#{index} "
    index += 5
  end
end
