def primes n
  positions = []
  for i in 2..n
    for j in i..n
      mul = i*j
      break if mul>n
      positions[i*j] = true
    end
  end
  primes = []
  for i in 2..n
    primes.push i if positions[i].nil?
  end
  primes
end

limit = 2000000
puts primes(limit).reduce :+