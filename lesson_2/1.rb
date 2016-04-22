months_2016 = {
  january:   31,
  february:  29,
  march:     31,
  april:     30,
  may:       31,
  june:      30,
  july:      31,
  august:    31,
  september: 30,
  october:   31,
  november:  30,
  december:  31
}

months30 = ''

months_2016.each do |month, days|
  months30 += "#{month.to_s.capitalize}, " if days == 30
end

puts "#{months30.chop.chop} are 30 days long in the year 2016."
