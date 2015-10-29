class Node
  attr_accessor :left, :right, :key, :value, :n

  def initialize(key, n=0)
    @n = n
    @key = key
  end

  def to_s
    "Key: #{self.key} \t Left: #{self.left.key if self.left} \t Right: #{self.right.key if self.right}"
  end

  def child_right?
    return self.right
  end

  def child_left?
    return self.left
  end

  def add_child_left(value)
    #puts "Theroetically, we're adding #{value} to the left of #{self.key}"
    self.left = Node.new(value)
  end

  def add_child_right(value)
    #puts "Theoretically, we're adding #{value} to the right of #{self.key}"
    self.right = Node.new(value)
  end

end
