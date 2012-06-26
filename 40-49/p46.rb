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


def squares n
  @squares = []
  i = 1
  while true
    index = 2 * (i**2)
    return if index>n
    @squares[index] = true
    i += 1
  end
end

limit = 10000

primes limit
squares limit
nums = []
for i in @primes.each_index
  if @primes[i].nil?
    for j in @squares.each_index
      if @squares[j]
        sum = i + j
        break if sum > limit
        nums[sum] = true
      end
    end
  end
end

for i in nums.each_index
  if !i.even? && @primes[i] && !nums[i] && i >1
    puts i
    exit 
  end
end
