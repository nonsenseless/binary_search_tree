class Bst

  class Node
    attr_accessor :left, :right, :key, :value, :n

    def initialize(key, n=0)
      @n = n
      @key = key
    end

    def to_s
      "Left: #{left.key}\nKey: #{self.key}\nRight: #{right.key}"
    end

    def child_right?
      return self.right
    end

    def child_left?
      return self.left
    end

    def add_child_left(value)
      puts "Theroetically, we're adding #{value} to the left of #{self.key}"
      self.left = Node.new(value)
    end

    def add_child_right(value)
      puts "Theoretically, we're adding #{value} to the right of #{self.key}"
      self.right = Node.new(value)
    end

  end

  attr_reader :root

  def initialize(keys, array_is_sorted=false)
    array_is_sorted ? build_balanced_tree(keys, 0, (keys.count-1)) : build_tree(keys)
  end

  def build_balanced_tree(keys, start_idx, end_idx)
    #puts "keys at the start of build_tree are #{keys.to_s}"

    return nil if start_idx > end_idx

    mid = (start_idx + end_idx)/2

    root = Node.new(keys[mid])

    root.left = build_tree(keys, start_idx, mid-1)
    root.right = build_tree(keys, mid+1, end_idx)

    return root
  end

  def build_tree(keys)


    @root = Node.new(keys.first)
    puts "The root of the tree is #{@root.key} from #{keys.first}"
    keys[1..-1].each do |key|
      puts "Build tree is putting key #{key}"
      put(key)
    end

  end

  def put(key, node=@root)
    puts "Inside put, key #{key} is being added to node #{node.key}"
    if key < node.key
      puts "Put has decided that #{key} is less than #{node.key}"
      node.child_left? ? put(key, node.left) : node.add_child_left(key)
    elsif key > node.key
      puts "Put has decided that #{key} is greater than #{node.key}"
      node.child_right? ? put(key, node.right) : node.add_child_right(key)
    else
      puts "Put has decided that the two keys are the same."
      node.key = key
    end
  end

  def to_s
    #puts @root
  end

end


arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
tree = Bst.new(arr)
tree.to_s
