def primes n
  @primes = [true,true]
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

  @primes2 = {}
  for i in @primes.each_index
    @primes2[i] = true if @primes[i].nil?
  end  
end

def prime? n
  if !@primes || n > @primes.size
    primes n*2
  end
  @primes[n].nil?
end

primes 1000000

def factores_primos n
   factors = {}
   while n>1
     for prime in @primes2.each_key
       while n%prime == 0
         n = n/prime
         factors[prime] ||=0
         factors[prime] +=1
       end
     end
   end
   factors
end

i = 644
limit = 4
fi = factores_primos(i)
fi2 = factores_primos(i+1)
fi3 = factores_primos(i+2)
fi4 = factores_primos(i+3)

while true
  if fi.size == limit and fi2.size == limit and fi3.size == limit and fi4.size == limit 
    puts "#{i} #{i+1} #{i+2} #{i+3}"
    exit
  end
  i+=1
  fi = fi2
  fi2 = fi3
  fi3 = fi4
  fi4 = factores_primos(i+3)

end
