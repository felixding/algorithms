class WeightedQuickUnion
  def initialize n
    @items = Array.new(n) {|i| i}
    @sizes = Array.new(n) {|i| 1}
  end

  def connected? p, q
    root(p) == root(q)
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
  [4, 3],
  [3, 8],
  [6, 5],
  [9, 4],
  [2, 1],
  [5, 0],
  [7, 2],
  [6, 1],
  [7, 3]
]

# correct answer is
# 62646 66244

uf = WeightedQuickUnion.new 10

operations.each do |operation|
  p, q = operation

  uf.union p, q
end
