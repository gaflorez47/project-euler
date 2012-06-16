base = 999
def reverse n
  number = 0
  while n > 0
    n2 = n%10
    number = (number * 10) + n2
    n = (n/10).truncate  
  end
  number
end

def palindrome base
  (base*1000)+reverse(base)
end

base.downto(100).each do |i|
  pal = palindrome i
  base.downto(100).each do |j|
    mod = pal % j
    div = pal / j 
    if mod == 0 && div.between?(100,999)
      puts "#{pal} #{j} #{pal/j}"
      exit
    end
  end  
end
