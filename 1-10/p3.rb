max = 600851475143
#max = 13195

def factores max
  numbers = []
  numbers2 = []
  y = 2 
  while numbers.empty? || y < numbers.min
    div = max/y 
    if max%y == 0
     # puts "#{y} #{div}"
      numbers2.push [y, div]
      numbers.push div
    end
    y+=1
  end
  numbers2
end

factores(max).each do |arr|
  a = arr[0]
  b = arr[1]
  puts "#{a} x #{b}" 
  f2 = factores(a)+factores(b)
  puts f2.inspect
end

