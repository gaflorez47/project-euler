def cycle n
  mod = 1%n
  nums = []
  while true
    if nums.include?(mod) 
      return nums.size - nums.index(mod)
    end
    return 0 if mod==0
    nums.push mod
    mod = mod*10%n
  end
end
cycle 3

limit = 1000
maxd = 0
max = 0
(1..limit).each do |i| 
  c = cycle i
  if c > max
    max = c
    maxd = i
  end
end

puts"d(#{maxd}): #{max}"
