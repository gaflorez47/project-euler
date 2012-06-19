input =
"75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"

class Node
  attr_accessor :children, :val
  def initialize v
    @val = v
    @children = []
  end

  def add_link node, cost
    @children.push({:node => node,:cost => cost})
  end

  def to_s
    links = @children.map(){|c| "{n:#{c[:node].val},c:#{c[:cost]}}"  }.join(',')
    "v:#{val} l:[#{links}]"
  end
end

rows = []

input.lines.each do |l|
  rows.push l.split(" ").map{|ln| Node.new ln.to_i }
end

def set_parent node, pi, pj, rows
  return if  pi < 0 || pj < 0 || rows[pi].nil? || rows[pi][pj].nil?
  parent = rows[pi][pj]
  parent.add_link node,100-node.val
end

rows.each_index do |i|
  row = rows[i]
  row.each_index do |j|
    node = row[j]
    set_parent node, i-1, j, rows
    set_parent node, i-1, j-1, rows
  end
end

def djk root
  parent = {}
  values = {}
  values[root] = root.val
  node = root
  list = []
  while !node.children.empty?
    node.children.each do |link|
      child = link[:node]
      val = values[node] + link[:cost]
      if values[child].nil? || val < values[child]
      parent[child] = node
      values[child] = val
      list.push child
      end
    end
    list.uniq!
    list.sort!{|a,b| values[a]<=>values[b]}
    node = list.shift
  end

  sum = 0
  while !node.nil?
    # puts temp.val
    sum += node.val
    node = parent[node]
  end
  puts sum
end

djk rows.first.first