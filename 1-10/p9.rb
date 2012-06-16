def a b
  n = 500000
  (n-(1000*b))/(1000-b)
end

def c a,b
  1000 - a - b
end

b=1
while b < 1000
 ca = a(b)
 cc = c ca,b
 sum = ca + b + cc
 if ca.integer? && ca>0 &&ca < b && b < cc && (ca*ca + b*b == cc*cc)
   puts "#{ca} #{b} #{c(ca,b)} #{sum}"
   puts ca * b * cc
 end
 b+=1 
end