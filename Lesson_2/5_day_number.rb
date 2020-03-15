puts 'Введите день'
day = gets.chomp.to_i
puts 'Введите месяц'
month = gets.chomp.to_i
puts 'Введите год'
year = gets.chomp.to_i

month_days = {
  '1' => 31,
  '2' => 28,
  '3' => 31,
  '4' =>30,
  '5' => 31,
  '6' => 30,
  '7' => 31,
  '8' => 31,
  '9' => 30,
  '10' => 31,
  '11' => 30,
  '12' => 31
}

=begin
  
Год високосный, если он делится на четыре без остатка, но если он делится на 100 без остатка, это не
високосный год. Однако, если он делится без остатка на 400, это високосный год. Таким образом, 2000
г. является особым високосным годом, который бывает лишь раз в 400 лет.
  
=end

if ((year % 4) == 0 && (year % 100) != 0) || (year % 400) == 0
  month_days['2'] = 29
end

i = 1
days = 0
while i < month
  days += month_days[i.to_s]
  i += 1
end
count = days + day
