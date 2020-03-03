puts "Введите сторону A"
a = gets.to_i
puts "Введите сторону B"
b = gets.to_i
puts "Введите сторону C"
c = gets.to_i

if (a == b) && (b == c)
	puts "Треугольник равносторонний"
elsif (a > b) && (a > c)
	if a**2 == b**2 + c**2
		puts "Треугольник прямоуголный"
	else 
		puts "Это обычный треугольник"
	end
elsif (b > a) && (b > c)
	if b**2 == a**2 + c**2
		puts "Треугольник прямоуголный"
	else 
		puts "Это обычный треугольник"
	end
elsif (c > b) && (c > b)
	if c**2 == b**2 + a**2
		puts "Треугольник прямоуголный"
	else 
		puts "Это обычный треугольник"
	end				
else 
		puts "Это обычный треугольник"
end