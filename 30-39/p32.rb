limit = 99999

def ndigits n 
  Math.log10(n).truncate + 1
end

def digits n
  nums = []
  while n>0
    nums.push n%10
    n /= 10
  end
  nums
end

def pandigital a,b,c
  all = digits(a) + digits(b) + digits(c)
  if all.size == 9
    all.sort == [1,2,3,4,5,6,7,8,9]
  else    
    false
  end
end


sum = 0
pandigitals = []

(1..limit).each do |i|
  di = ndigits i
  j = i
  begin
    j += 1
    dj = ndigits j
    mul = i*j
    dm = ndigits mul
    break if mul > limit
    if pandigital i,j,mul
      pandigitals.push mul
      sum += mul
      puts "#{i} x #{j} = #{mul}"
    end
  end while di+dj+dm <=9
end
pandigitals.uniq!
puts pandigitals.reduce :+