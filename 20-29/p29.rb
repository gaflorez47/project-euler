a = (2..100).to_a
b = (2..100).to_a

nums = []

a.each do |i|
  b.each do |j|
    nums.push(i**j)
    nums.uniq!
  end
end
#puts nums.sort.inspect
puts nums.size