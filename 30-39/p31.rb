@values = [1,2,5,10,20,50,100,200]
@target = 200

def count_sum arr=[0]
  sum = 0
  arr.each_index do |i|
    sum += @values2[i] * arr[i]
  end
  sum
end 

def build_tree acum
  tree = @tree
  acum.each_index do |i|
    multiplier = acum[i]
    tree ||={}
    tree[multiplier] ||={}
    tree = tree[multiplier]
  end
  nil
end

@values2 = @values.reverse
@tree = {}
@sum = 0

def count pos=0, acum = []
  return if pos>=@values2.size
  value = @values2[pos]
  options = @target/value
  (0..options).each do|i|
    acum2 = acum + [i]
    sum = count_sum acum2
    if sum == @target
      @sum +=1
      build_tree acum2
    elsif sum > @target
      return
    else
      count pos+1, acum2      
    end
  end
end

count()

#puts @tree.inspect
puts @sum
