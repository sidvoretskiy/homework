arr = [1,2]
loop do
  number = arr[-1] + arr[-2]
  if number < 100
    arr.push(number)
  else
    break
  end
end
puts arr
