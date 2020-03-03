puts "Введите свое имя"
user_name = gets
puts "Введите свой рост"
height = gets

optimal = (height.to_i - 110)*1.15

if optimal > 0
	puts "Ваш оптимальный вес #{optimal}"
else
	puts "Ваш вес уже оптимальный"
end

