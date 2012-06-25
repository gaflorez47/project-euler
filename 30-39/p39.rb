def solutions p
  s = 0
  for c in 1...p
    c2 = c**2
    for b in 1...c
      b2 = b**2
      a = p - c - b
      a2 = a**2
      abc = a+b+c
      ab2 = a2+b2
      break if ab2>c2
      if c2 == ab2 and abc == p
       # puts "#{p}: [#{a},#{b},#{c}]"
        s +=1
      end
    end
  end
  s
end

max = 0
maxp = 0

for p in 1..1000
  a = solutions p
  if max > a
    max = a
    maxp = p
  end
end


puts "#{maxp}: #{max}"
