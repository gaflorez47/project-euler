def ss1 n
  (1..n).reduce{|sum, n| sum + n*n}
end

def ss2 n
  p = (1..n).reduce{|sum, n| sum + n}
  p*p
end
n = 100
puts ss2(n) - ss1(n)
