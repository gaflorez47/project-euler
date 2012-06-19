@@map = {}

def reduce n, step = 1
  if @@map[n]
    return @@map[n]
  elsif n == 1 || n == 0
    return step
  elsif n.even?
    @@map[n] = reduce(n/2) + step
    return @@map[n] 
  else
    @@map[n] = reduce(3*n +1) + step
    return @@map[n]
  end
end

limit = 1000000
max = 0
maxn = 0


limit.times do |i|

  r = reduce i
  #puts "#{i} #{r}"
  if r > max
    maxn = i
    max = r
  end
end

puts maxn

