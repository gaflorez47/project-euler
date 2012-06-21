limit = 1000000
str = '0123456789'
nums = str.each_char.to_a

perms = nums.permutation.to_a
puts perms[limit-1].join
