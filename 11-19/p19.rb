require 'Date'
low = Date.new 1901,1,1
top = Date.new 2000,12,31
puts (low..top).reduce(0){|sum, d|
  if d.sunday? && d.day ==1
    sum+1
  else 
    sum
  end
  }
