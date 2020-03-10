puts "Введите свое имя"
user_name = gets
puts "Введите свой рост"
height = gets.to_i

optimal = (height - 110) * 1.15

if optimal > 0
	puts "Ваш оптимальный вес #{optimal}"
else
	puts "Ваш вес уже оптимальный"
end
