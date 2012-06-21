input = File.open("names.txt", "r").read.gsub('"','')
names = input.split(',').sort


def score name, pos
  pos * name.each_char.reduce(0) {|sum, c| sum + c.ord + 1 - 'A'.ord}
end

puts names.each_index.reduce(0){|sum, i| sum + score(names[i], i+1)}

