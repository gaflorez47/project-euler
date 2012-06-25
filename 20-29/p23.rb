def divisors n
  sqrt = Math.sqrt(n).truncate
  nums = []
  for i in 1..sqrt
    if n%i ==0
      nums += [i,n/i]
    end
  end
  nums.uniq
end

def abundant? n
  (n*2) < divisors(n).reduce(0) {|s,x| s+x}
end

limit = 28123
@abundants = (0..limit).map{|i|abundant? i}
abunds = (0..limit).reject{|x| !@abundants[x]}

#puts abunds.inspect

not_sumabuns = []

for x in abunds
    for x2 in abunds
      sum = x+x2
      break if sum > limit
      not_sumabuns[sum] = true
    end
end

sum = 0
not_sumabuns.each_index do |i|
  sum += i if !not_sumabuns[i]
  puts i if !not_sumabuns[i]
end
puts sum
