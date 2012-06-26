limit = 1000
sum = (1..1000).reduce(0){|s,x| s + x**x}
str = sum.to_s
puts str[str.size()-10..str.size()-1]
