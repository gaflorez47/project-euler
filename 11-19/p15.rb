n = 20
@@map = []
(n+1).times.each do |i|
  @@map[i] = (n+1).times.map {|j|nil}
end

def count i=0,j=0
  return 0 unless i.between?(0,@@map.size-1) && j.between?(0,@@map.size-1)
  return 1 if i == @@map.size-1 && j == @@map.size-1
  unless @@map[i][j]
    @@map[i][j] = count(i+1,j) + count(i,j+1)
  end
  @@map[i][j]
end
count
puts @@map[0][0]
