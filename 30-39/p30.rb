def powern? n, pow
  sum = 0
  n2 = n
  while n2>0
    sum += (n2%10)**pow
    n2 /= 10
  end
  sum == n
end

power = 5
ndigits = 1
begin
  ndigits += 1
  limit = ndigits * (9**power)
  digits = Math.log10(limit).truncate
end while digits >= ndigits

nums = []
(2..limit).each do |i|
  nums.push i if powern? i, power
end

puts nums.inspect
puts nums.reduce(:+)
