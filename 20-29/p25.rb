limit = 1000
low_bound = 10**(limit-1)

fx_1 = 1 
fx = 1
i = 2
while true
  tmp = fx
  fx += fx_1
  fx_1 = tmp
  i+=1
  if fx > low_bound
    puts i
    exit
  end
end

