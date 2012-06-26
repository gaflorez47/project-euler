def word_val str
  str.chars.reduce(0){|sum,c| sum + c.ord - 'A'.ord() +1}
end
def t n
  (n*(n+1))/2
end

input = File.open("words.txt", "r").read
words = input.gsub('"','').split ','
limit = word_val 'ZZZZZZZZZ'
triangles = (0..limit).map{|x| t x}

puts words.reduce(0){|sum, word| 
  if triangles.include?(word_val(word))
    sum +1
  else 
    sum
  end
  }
