lcm = 1
(1..20).each do |i|
  lcm = i.lcm(lcm)
end
puts lcm