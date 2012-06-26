def fraction n
 (1..n).map{|x|x.to_s}.join ''
end

limit = 1000005
fractions = fraction limit
arr = (0..6).map{|x| 10**x}

puts arr.reduce(1){|m,index| m*fractions[index-1].to_i}
