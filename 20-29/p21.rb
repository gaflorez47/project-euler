def d n
  x = 1
  div = 999999
  sum = 0
  while div > x
    mod = n%x
    div = n/x
    if mod == 0
      sum += x
      sum += div if div<n
    end
    x += 1
  end
  sum
end

limit = 10000
marks = []
sum = 0
(1..limit).each do |i|
  next if marks[i]
  ami = d i
  marks[i] = true
  if ami < limit && ami != i
    ami2 = d ami
    marks[ami] = true
    if i == ami2
      puts "#{ami} #{ami2}"
      sum += ami+ami2
    end
  end  
end
puts sum