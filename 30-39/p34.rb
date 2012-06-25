def digits n
  nums = []
  while n>0
    nums.push n%10 
    n /= 10
  end
  nums
end

def fact n 
  n.downto(1).reduce(:*) || 1
end

def curious n
  digits(n).reduce(0){|s,i| s+@facts[i]}
end

def curious? n
  n == curious(n)
end


@facts = (0..10).map{|i|fact i}
limit = fact(9)

for i in 1..limit
 puts i if curious? i
end
