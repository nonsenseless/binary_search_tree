class Crawler
  attr_accessor :tree, :queue

  def initialize(tree)
    @tree = tree
    @visited = []
    @queue = []
    puts "Crawler activated!"
  end

  def bfs(key_value)
    queue = [tree.root]
    visited.clear

    until queue.empty?
      node = queue.shift

      #I'd like to factor these calls out to a helper method.
      queue.push(node.left) unless node.left.nil? || visited.include?(node.left)
      queue.push(node.right) unless node.right.nil? || visited.include?(node.right)
      #add_right_child(node)
      #add_left_child(node)
      visited.push(node)

      if node.key == key_value
        return "I found the key #{key_value} : #{node.key}! I had to visit #{visited_as_string} and had marked #{queue_as_string} for subsequent visits! Can I go home now?"
      end
    end

    return nil
  end

  def dfs(key_value)
    queue = [tree.root]
    visited.clear

    until queue.empty?
      node = queue.shift
      queue.unshift(node.right) unless node.right.nil? || visited.include?(node.right)
      queue.unshift(node.left) unless node.left.nil? || visited.include?(node.left)
      visited.push(node)

      if node.key == key_value
        return "I found the key #{key_value} : #{node.key}! I had to visit #{visited_as_string} and had marked #{queue_as_string} for subsequent visits! Can I go home now?"
      end
    end

    return nil
  end

  def dfs_rec(key_value, node=tree.root)
    if node.key == key_value
      puts "I found #{key_value} at #{node.key}!"
    else
      puts "I didn't find #{key_value} at #{node.key}"
      #puts "THe left node from here is #{node.left.key unless node.left.key.nil?} and the right node is #{node.right.key unless node.right.key.nil?}"
      dfs_rec(key_value, node.left) unless node.left.nil? || visited.include?(node.left)
      dfs_rec(key_value, node.right) unless node.right.nil? || visited.include?(node.right)
    end
  end

  def add_right_child(parent)
    #Currently not working
    right = parent.right
    puts "Adding #{parent.key}'s right child #{right.key}'"
    queue << parent.right unless parent.right.nil? || visited.include?(parent.right)
  end

  def add_left_child(parent)
    #Currently not working
    left = parent.left
    puts "Adding #{parent.key}'s left child #{left.key unless left.nil?}'"
    queue << parent.left unless parent.left.nil? || visited.include?(parent.left)
  end

  def visited
    @visited
  end

  def visited_as_string
    string = ""

    visited.each do |node|
      string << node.to_s
    end

    string
  end

  def queue
    @queue
  end

  def queue_as_string
    string = ""

    queue.each do |node|
      string << node.to_s
    end

    string
  end

end
