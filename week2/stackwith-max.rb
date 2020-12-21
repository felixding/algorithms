class StackWithMax
  def initialize
    @stack = []
  end

  def push item
    @stack.push item
  end

  def pop
    @stack.pop
  end

  def max
    @stack.max
  end
end

s = StackWithMax.new

puts "s.push 1, 2 and 3"

(1..3).to_a.each {|e| s.push e}

puts "s.pop: #{s.pop}"

puts "s.max: #{s.max}"
