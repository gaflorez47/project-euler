def digits n
  nums = []
  while n>0
    nums.insert(0, n%10)
    n /= 10
  end
  nums
end

def curious? x,y
  a,b = digits x
  c,d = digits y
  div = Rational(x,y)
  rat = nil
  if d==0 or c ==0 or x == y or div >1.0
    return false
  elsif a==c 
    rat = Rational(b,d) 
  elsif a==d
    rat = Rational(b,c)
  elsif b==c
    rat = Rational(a,d)
  elsif b==d
    rat = Rational(a,c) 
  end
  rat == div
end

range = (10..99).to_a
mul = 1
range.each do |i|
  range.each do |j|
    if curious? i,j
      mul *= Rational(i,j)
      puts "curious #{i}/#{j} => #{Rational(i,j)}"      
    end 
  end
end

puts mul