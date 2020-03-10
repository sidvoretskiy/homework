puts "Введите сторону A"
a = gets.to_f
puts "Введите сторону B"
b = gets.to_f
puts "Введите сторону C"
c = gets.to_f

max_length = [a,b,c].max
min_length = [a,b,c].min

if min_length == max_length
  puts "Треугольник равносторонний"
elsif a == max_length
  if a ** 2 == b ** 2 + c ** 2
    puts "Треугольник прямоуголный"
  else 
    puts "Это обычный треугольник"
  end
elsif b == max_length
  if b ** 2 == a ** 2 + c ** 2
    puts "Треугольник прямоуголный"
  else 
    puts "Это обычный треугольник"
  end
elsif c == max_length
  if c ** 2 == b ** 2 + a ** 2
    puts "Треугольник прямоуголный"
  else 
    puts "Это обычный треугольник"
  end				
else 
    puts "Это обычный треугольник"
end
