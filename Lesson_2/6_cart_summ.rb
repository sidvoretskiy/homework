cart = {}
loop do
  puts 'Введите название товара'
  product = gets.chomp
  break if product == 'стоп' 
  puts 'Введите цену товара'
  price = gets.chomp.to_f
  puts 'Введите колличество товара'
  quantity = gets.chomp.to_f
  cart[product]={ price => quantity }
end
sum = 0
puts cart
cart.each do |product,price|
  price.each do |a,b| 
    line_sum = a * b
    puts "#{product}, сумма за товар = #{line_sum}"
    sum += line_sum
  end
end
puts "Общая стоимость покупок: #{sum}"
