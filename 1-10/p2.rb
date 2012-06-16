max = 4000000
fx_1 = 1 
fx = 1
sum = 0

while(fx < max) do
  tmp = fx
  fx += fx_1
  fx_1 = tmp
  if fx%2 == 0
    sum += fx
    puts fx
  end
end
puts "Sum: #{sum}"
