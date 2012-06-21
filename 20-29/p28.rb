def spiral n
  x = 1
  nums = [x]
  n2 = n**2
  row = 1
  while x < n2
    if (nums.size-1)%4 == 0
      row +=2
    end  
    x += row-1
    nums.push x
  end
  nums
end

puts spiral(1001).reduce(:+)
