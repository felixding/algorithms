# https://knaidu.gitbooks.io/problem-solving/content/stacks_and_queues/queue_with_2_stacks.html

class TwoStacksQueue
  def initialize
    @stack1 = []
    @stack2 = []
  end

  def push item
    @stack1.push item
  end

  def pop
    move_elements if @stack2.empty?

    @stack2.pop
  end

  private

  def move_elements
    @stack2.push @stack1.pop
  end
end

q = TwoStacksQueue.new

puts "q.push 1, 2 and 3"

(1..3).to_a.each {|e| q.push e}

puts "q.pop: #{q.pop}"

puts "q.push 4"

q.push 4

puts "q.pop: #{q.pop}"
