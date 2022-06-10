class PolyTreeNode

  attr_reader :parent, :children, :value

  def initialize(value = nil)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(p_node)
    if self.parent != p_node && self.parent != nil
      self.parent.children.delete(self)
    end
    @parent = p_node
    if self.parent != nil && !p_node.children.include?(self)
      p_node.children << self
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Not my child!" if !self.children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target)
    return self if self.value == target
    return nil if self.children.empty?

    self.children.each do |child| 
      
      return child.dfs(target)
    end
  end 

end