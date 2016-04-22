cart = {}

loop do
  print 'Enter product name: '
  product = gets.chomp.capitalize

  break if product.casecmp('stop').zero?

  print 'Enter product price: '
  price = gets.to_f
  print 'Enter product quantity: '
  quantity = gets.to_f

  if cart[product].nil?
    cart[product] = { price => quantity }
  elsif cart[product][price].nil?
    cart[product].update(price => quantity)
  else
    cart[product][price] += quantity
  end
end

puts '---------------------------------'

cart_total = 0

cart.each do |product, properties|
  puts "Product name: #{product}."
  product_total = 0
  properties.each do |price, quantity|
    product_total += price * quantity
    puts "Price = #{price}. Quantity = #{quantity}."
  end
  puts "Product total: #{product_total}."
  cart_total += product_total
end

puts '---------------------------------'
puts "Cart total: #{cart_total}."
