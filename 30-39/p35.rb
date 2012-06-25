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

def rotations n
  dn = digits n
  rotations = [n]
  dn2 = []+dn
  (dn.size()-1).times do |i|
    dn2.rotate!
    rotations.push digits_toi(dn2)
  end  
  rotations
end


def all_primes? arr
  arr.reduce(true){|cond,n| cond and prime?n}
end

limit = 1000000
@prs = primes limit
circulars = []
primos = []
@prs.each_index do |i|
  val = @prs[i]
  if val.nil?
    rs = rotations i
    if all_primes? rs
     circulars.push i
    end
  end
end
circulars.uniq!
circulars.sort!
puts circulars.inspect
puts circulars.size