def p n
  (n*(3*n-1))/2
end

def p? n
  @nums[n]
end

limit = 10000000

@nums = []
for i in (1..limit)
  val = p i
  break if val > limit
  @nums[val] = true
end

nums = []
for i in @nums.each_index
  if @nums[i]
    nums.push i
  end
end
#puts nums.inspect

for i in 0...nums.size
  pj = nums[i]
  for k in 0...nums.size
    pk = nums[k]
    pb = (pj - pk).abs
    pa = pj + pk
    if p?(pb) && p?(pa)
      puts "#{pb}"
      exit
    end 
  end
end
