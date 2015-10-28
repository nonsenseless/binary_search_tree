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
  end

  attr_reader :root

  def initialize(keys)
    @root = build_tree(keys, 0, (keys.count-1))
  end

  def build_tree(keys, start_idx, end_idx)
    #puts "keys at the start of build_tree are #{keys.to_s}"

    return nil if start_idx > end_idx

    mid = (start_idx + end_idx)/2

    root = Node.new(keys[mid])

    root.left = build_tree(keys, start_idx, mid-1)
    root.right = build_tree(keys, mid+1, end_idx)

    return root
  end

  def put(key, node=root)
    if node == nil
      return Node.new(key)
    elsif key < node.key
      put(key, node.left)
    elsif key > node.key
      put(key, node.right)
    else
      node.key = key
    end
  end

  def to_s
    puts @root
  end

end


arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
tree = Bst.new(arr)
tree.to_s
