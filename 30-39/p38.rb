def digits n
  return [] if n <1
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

def arr_val arr
  arr.reduce(0){|s,x| s*10 + x}
end

def pandigital num, n
  nums = (1..n).map {|i| num*i}
  nums.map!{|x| digits x}
  nums.flatten!
  nums
end


def pandigital? arr
  return false if arr.size > 9
  arr.sort == (1..9).to_a
end

max = 0
starts = [0,0,1000,100,10,1,1,1,1,1,1,1,1,1]
for n in 2..9
  i = starts[n]
  while true
    ps = pandigital i,n
    break if ps.size > 10
    if pandigital? ps
      puts "#{i}: #{ps.join ''}"
      max = [max, arr_val(ps)].max
    end
    i+=1
  end
end

puts max