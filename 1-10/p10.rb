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
limit = 2000000
i = 1
while i < limit
  primes.push i if prime? i
  i += 2
end

puts primes.reduce :+
