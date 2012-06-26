def t n
  (n*(n+1))/2
end
def p n
  (n*(3*n-1))/2
end
def h n
  (n*(2*n-1))
end

min = 40755
last = 0
nums = {}
i = 1
while last <= min
  a,b,c = t(i), p(i), h(i)
  nums [a] ||=0 
  nums [b] ||=0 
  nums [c] ||=0 

  nums [a] +=1 
  nums [b] +=1 
  nums [c] +=1
  
  if nums[a] == 3
    puts a
    last = a
  end 
  i += 1
end