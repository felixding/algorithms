class IllegalArgumentException < StandardError
end

class Deque
  def initialize
    @deque = []
  end

  def is_empty?
    @deque.empty?
  end

  def size
    @deque.size
  end

  def add_first item
    raise IllegalArgumentException unless item

    @deque.insert 1, item
  end

  def add_last item
    raise IllegalArgumentException unless item

    @deque.push item
  end

  def remove_first
    @deque.delete_at 0
  end

  def remove_last
    @deque.pop
  end

  def iterator
    @deque
  end
end

deque = Deque.new
#deque.add_first nil
