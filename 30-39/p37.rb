def primes n
  positions = [true,true]
  for i in 2..n
    for j in i..n
      mul = i*j
      break if mul>n
      positions[i*j] = true
    end
  end
  positions
end
def digits n
  nums = []
  while n>0
    nums.insert(0, n%10)
    n /= 10
  end
  nums
end
def digits_toi ds
  ds.reduce(0){|s,d|  s*10+ d}
end
def prime? n
  prs = @primes
  @primes ||= []
  if @primes.size() < n
    @primes = primes [n*10, 100000].max
  end
  @primes[n].nil?
end

def prime_digits? n
  dn = digits n
  dn2 = []+dn
  dn3 = []+dn
  while dn2.size > 0
    val = digits_toi dn2
    val2 = digits_toi dn3
    return false if !prime?(val) or !prime?(val2)
    dn2.pop
    dn3.shift
  end
  
  true
end

@primes = primes 100000
limit = 11
count = 0
i = 11
my_primes = []
while my_primes.size < limit 
  if prime?(i) 
    if prime_digits?(i)
      my_primes.push i
    end
  end
  i+=2
end

puts my_primes.inspect
puts my_primes.reduce :+