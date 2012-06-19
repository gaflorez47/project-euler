def divisors n
  numbers = 0
  (1..n).each do |i|
    mod = n % i
    div = n / i
    numbers += 2 if mod == 0
    break if div < i
  end
  numbers
end

limit = 500
i = 1
sum = 1
divs = 0
while divs < limit
  i += 1
  sum += i
  divs = divisors sum
  puts "#{sum}: #{divs}"
end

puts sum