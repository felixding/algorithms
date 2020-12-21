class QuickUnion
  def initialize n
    @items = Array.new(n) {|i| i}
  end

  def connected? p, q
    root(p) == root(q)
  end

  def union p, q
    @items[root(p)] = root(q)

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
  [3, 4],
  [5, 6],
  [7, 8],
  [7, 9],
  [2, 8],
  [0, 5],
  [1, 9]
]

uf = QuickUnion.new 10

operations.each do |operation|
  p, q = operation

  #puts "p: #{p}, q: #{q}"
  uf.union p, q
end
