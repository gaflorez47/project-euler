def prime? n
  return true if n == 2 || n == 3
  return false if n.even? || n == 1
  x = 3
  div = 999999
  while div > x
    mod = n%x
    div = n/x
    return false if mod == 0
    x += 2
  end
  return true
end
primes = []
objective = 10001
i = 1
while primes[objective].nil?
  primes.push i if prime? i
  i +=1
end

puts primes[objective-1]