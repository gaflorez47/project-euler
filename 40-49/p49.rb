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

def prime? n
  if !@primes || n > @primes.size
    primes n*2
  end
  @primes[n].nil?
end

limit = 10000
primes limit

for i in 1000..limit
  if prime? i
    di = digits i
    nums = di.permutation(4).map{|arr| digits_val arr}
    nprimes = []      
    for x in nums
      nprimes.push x if x>1000 && prime?(x)
    end
    nprimes.uniq!
    if nprimes.size >= 3
      suspect = nprimes.shift
      diffs = {}
      for x in nprimes
        diff = (suspect - x).abs
        diffs[diff] ||=[]
        diffs[diff].push x
        if(diffs[diff].size>1)
          solution = [suspect] + diffs[diff]
          puts "#{solution.sort.inspect}"
          puts "#{solution.sort.join ''}"
        end
      end      
    end
  end  
end
