puts "Введите А"
a = gets.to_i
puts "Введите B"
b = gets.to_i
puts "Введите C"
c = gets.to_i

d = (b ** 2 - 4 * a * c)

sqrt_d = Math.sqrt(d)

if d > 0
  puts "Дискриминант = " + d.to_s + " x1 = #{(- b + sqrt_d) / (2 * a)} x2 = #{(- b - sqrt_d) / (2 * a)}"
elsif d == 0
  puts "Дискриминант = 0, х1 = х2 = #{(-b) / (2 * a)}"
else
  puts "Дискриминант вычислить нельзя"
end
