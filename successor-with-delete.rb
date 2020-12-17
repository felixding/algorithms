class WeightedQuickUnion
  def initialize n
    @items = Array.new(n) {|i| i}
    @sizes = Array.new(n) {|i| 1}
    @largest_elements = Array.new(n) {|i| i}
    @is_removed = Array.new(n) {|i| false}
  end

  def connected? p, q
    root(p) == root(q)
  end

  def find i
    @largest_elements[root(i)]
  end

  def remove i
    #return if @is_removed[i] == true

    @is_removed[i] = true
    #puts "@is_removed: #{@is_removed.inspect}"

    union(i, i - 1) if (i > 0 && @is_removed[i - 1] == true)
    union(i, i + 1) if (i < @items.size - 1 && @is_removed[i + 1] == true)
  end

  def successor i
    return i if @is_removed[i] == false

    s = find(i) + 1

    return nil if s >= @items.size
    return s
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

      if @largest_elements[q_root] > @largest_elements[p_root]
        @largest_elements[p_root] = @largest_elements[q_root]
      end
    else
      # link root of smaller tree to root of larger tree
      @items[p_root] = q_root

      # update the @sizes array
      @sizes[q_root] += @sizes[p_root]

      if @largest_elements[p_root] > @largest_elements[q_root]
        @largest_elements[q_root] = @largest_elements[p_root]
      end
    end

    #puts
    #puts "Connected #{p} with #{q}"
    #puts "@items: #{@items}"
  end

  private

  def root i
    @items[i] == i ? i : root(@items[i])
  end
end

xs = [2, 3, 8, 9, 5, 4]
operations = [
  [2, 2, 3],
  [3, 2, 4],
  [8, 8, 9],
  [9, 8, nil],
  [5, 4, 6],
  [4, 3, 6]
]

uf = WeightedQuickUnion.new 10

operations.each do |operation|
  to_be_removed, successor_of, successor_should_be = operation
  uf.remove to_be_removed
  puts "After removing #{to_be_removed}, the successor of #{successor_of} is #{uf.successor successor_of}, which should be #{successor_should_be}"
end
