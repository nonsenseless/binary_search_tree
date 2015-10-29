require_relative 'node'
require_relative 'crawler'

class Bst

  attr_accessor :root

  def initialize(keys, array_is_sorted=false)
    array_is_sorted ? @root = build_balanced_tree(keys, 0, (keys.count-1)) : build_tree(keys)
    puts "Binary Search Tree Prepped!"
  end

  def build_balanced_tree(keys, start_idx, end_idx)
    #puts "keys at the start of build_tree are #{keys.to_s}"

    return nil if start_idx > end_idx

    mid = (start_idx + end_idx)/2

    root = Node.new(keys[mid])

    root.left = build_balanced_tree(keys, start_idx, mid-1)
    root.right = build_balanced_tree(keys, mid+1, end_idx)

    return root
  end

  def build_tree(keys)
    @root = Node.new(keys.first)
    #puts "The root of the tree is #{@root.key} from #{keys.first}"
    keys[1..-1].each do |key|
      #puts "Build tree is putting key #{key}"
      put(key)
    end
  end

  def put(key, node=@root)
    #puts "Inside put, key #{key} is being added to node #{node.key}"
    if key < node.key
      #puts "Put has decided that #{key} is less than #{node.key}"
      node.child_left? ? put(key, node.left) : node.add_child_left(key)
    elsif key > node.key
      #puts "Put has decided that #{key} is greater than #{node.key}"
      node.child_right? ? put(key, node.right) : node.add_child_right(key)
    else
      #puts "Put has decided that the two keys are the same."
      node.key = key
    end
  end

  def to_s
    @root.to_s
  end


end


arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
tree = Bst.new(arr, true)

arr2 = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree2 = Bst.new(arr2)

c = Crawler.new(tree2)
puts c.bfs(6345)
puts c.bfs(8)

puts c.dfs(6345)
puts c.dfs(8)

c = Crawler.new(tree2)

c.dfs_rec(67)

c = Crawler.new(tree2)


c.dfs_rec(324)
