nums = (0..9).to_a
def digits_val arr
  arr.reduce(0){|s,x| s*10 + x}
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

def val2 perm, a,b,c, mod
  return false if perm[a-1].nil? or perm[b-1].nil? or perm[c-1].nil? 
  val =   (100*perm[a-1] + 10*perm[b-1] + perm[c-1])
  modulo = val%mod
  modulo == 0
end


def pandigital? perm
  return ( val2(perm,2,3,4,2) and 
    val2(perm,3,4,5,3) and
     val2(perm,4,5,6,5) and 
     val2(perm,5,6,7,7) and 
     val2(perm,6,7,8,11) and
      val2(perm,7,8,9,13) and 
      val2(perm,8,9,10,17) )
end

sum = 0

for perm in nums.permutation
  val = digits_val perm
  if pandigital? perm
    puts perm.inspect
    sum += val
  end
end

puts sum