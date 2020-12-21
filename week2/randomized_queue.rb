class RandomizedQueue
  def initialize
    @deque = []
  end

  def is_empty?
    @deque.empty?
  end

  def size
    @deque.size
  end

  def enqueue item
    @deque.push item
  end

  def dequeue
    @deque.shuffle.pop
  end

  def sample
    @deque.sample
  end

  def iterator
    @deque.shuffle
  end
end

rq = RandomizedQueue.new

(1..5).to_a.each {|e| rq.enqueue e}

puts "Sample: #{rq.sample}"
puts "Dequeue: #{rq.dequeue}"
