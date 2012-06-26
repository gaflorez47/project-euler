def digits_val arr
  arr.reduce(0){|s,x| s*10 + x}
end

def prime? n
  return false if n == 1 || n ==0
  return true if n == 2
  
  sqrt = Math.sqrt(n).truncate
  
  for i in 2..sqrt
    if n%i == 0
      return false
    end
  end
  true
end

limit = 987654321
response = 1
for num_digits in 2..9
  arr = (1..num_digits).to_a
  for perm in arr.permutation
    val = digits_val perm
    response = val if prime? val
  end
end

puts response