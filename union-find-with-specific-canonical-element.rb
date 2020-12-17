class WeightedQuickUnion
  def initialize n
    @items = Array.new(n) {|i| i}
    @sizes = Array.new(n) {|i| 1}
  end

  def connected? p, q
    root(p) == root(q)
  end

  def find i
    i_root = root(i)

    component = []

    @items.each_index do |index|
      component << index if i_root == root(index)
    end

    component.max
  end

  def union p, q
    p_root = root p
    q_root = root q

    return if p_root == q_root

    if @sizes[p_root] > @sizes[q_root]
      # link root of smaller tree to root of larger tree
      @items[q_root] = p_root

      # update the @sizes array
      @sizes[p_root] += @sizes[q_root]
    else
      # link root of smaller tree to root of larger tree
      @items[p_root] = q_root

      # update the @sizes array
      @sizes[q_root] += @sizes[p_root]
    end

    puts
    puts "Connected #{p} with #{q}"
    puts "@items: #{@items}"
  end

  private

  def root i
    @items[i] == i ? i : root(@items[i])
  end
end

operations = [
  [1, 2],
  [2, 6],
  [6, 9]
]

uf = WeightedQuickUnion.new 10

operations.each do |operation|
  p, q = operation

  uf.union p, q
end

component = [1, 2, 6, 9]
component.each do |i|
  puts
  puts "The largest element in #{component} containing #{i} is #{uf.find(i)}"
end
