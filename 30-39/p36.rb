def palindrome? s
  (s.size()/2).times do |i|
    return false if s[i] != s[s.size-i-1]    
  end
  true 
end

limit = 1000000

pals = []
(1..limit).each do |i|
  if palindrome?(i.to_s()) and palindrome?(i.to_s(2))
    pals.push i
  end
end

puts pals.inspect
puts pals.reduce :+