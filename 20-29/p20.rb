limit = 100

fact = (1..limit).reduce(:*)

sum = 0
while fact > 0
  sum += fact % 10
  fact /= 10
end
puts sum