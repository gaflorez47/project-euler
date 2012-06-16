def sum n
  numbers = []
  index = 1
  result = n
  while result < 1000 do
    numbers.push result
    index += 1
    result = index * n
  end
  numbers
end

s5 = sum 5
s3 = sum 3
s = (s5 + s3).uniq.sort
puts s.reduce(:+)
