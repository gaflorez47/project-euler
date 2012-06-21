def f a,b,n
  (n**2) + (a*n) + b
end

def primes n
  positions = []
  positions[0] = true
  positions[1] = true
  for i in 2..n
    for j in i..n
      mul = i*j
      break if mul>n
      positions[i*j] = true
    end
  end
  positions
end

@p_limit = 10000
@primes_a = primes @p_limit

def count_primes a,b
  primes = @primes_a
  n, fn = 0, f(a,b,0)
  while fn > 1 && @primes_a[fn].nil?
    n +=1
    fn = f(a,b,n)
    if fn > @p_limit
      @p_limit = fn *2
      @primes_a = primes @p_limit
    end
  end
  n
end

max = 0
maxab = []
range = 1000 - 1
count = 0
(-range..range).each do |a|
  (-range..range).each do |b|
    next if a.even? or b.even?
    count = count_primes a,b
    if count>max 
      max = count
      maxab = [a,b]
      #puts "#{maxab.inspect}: #{max}"
    end
  end
end
puts "#{maxab.inspect}: #{max}"
