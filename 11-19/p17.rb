numbers = "zero
one
two
three
four
five
six
seven
eight
nine
ten
eleven
twelve
thirteen
fourteen
fifteen
sixteen
seventeen
eighteen
nineteen
twenty"
numbers = numbers.lines.map{|l| l.gsub /\n/, ''}
numbers[30] = 'thirty'
numbers[40] = 'forty'
numbers[50] = 'fifty'
numbers[60] = 'sixty'
numbers[70] = 'seventy'
numbers[80] = 'eighty'
numbers[90] = 'ninety'
(1..9).each do |i|
  numbers[i*100] = "#{numbers[i]} hundred" 
end
numbers[1000] = 'one thousand'

def n1d a, numbers
  numbers[a] 
end

def n2d a,b, numbers
  if a==0
    n1d b, numbers
  elsif a == 1 || b == 0
    numbers[a*10+b]
  else
    "#{numbers[a*10]} #{numbers[b]}"
  end
end

def n3d a,b,c, numbers
  if a==0
    n2d b,c, numbers
  else
    "#{numbers[a*100]} and #{n2d b,c,numbers}"
  end
end

(1..1000).each do |i|
  unless numbers[i]
    a = (i / 100).truncate
    b = ((i%100)/10).truncate
    c = i%10
    numbers[i] = n3d a,b,c,numbers
  end
end

#puts numbers[1..1000]
puts numbers[1..1000].join(" ").gsub(' ','').size