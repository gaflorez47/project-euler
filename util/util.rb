def primes n
  @primes ||= [true,true]
  prs = @primes 
  for num in (2..n/2)
    next if @primes[num]
    maxi = n / num
    for i in (num..maxi)
      next if @primes[i] && @primes[i] != num
      mul = num * i
      @primes[mul] = num
    end
  end
  @primes
end

def prime? n
  if !@primes || n > @primes.size
    primes n*2
  end
  @primes[n].nil?
end


def digits n
  size = 1 + Math.log10(n).truncate
  nums = Array.new(size)
  i = size-1
  while n>0
    nums[i] = n%10
    n /= 10
    i -= 1
  end
  nums
end

def digits_val arr
  arr.reduce(0){|s,x| s*10 + x}
end

def divisors n
  sqrt = Math.sqrt(n).truncate
  nums = []
  for i in 1..sqrt
    if n%i ==0
      nums += [i,n/i]
    end
  end
  nums
end