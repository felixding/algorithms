# https://boweixu.me/posts/intro-to-union-find-data-structure-exercise/
class WeightedQuickUnion
  def initialize n
    @items = Array.new(n) {|i| i}
    @sizes = Array.new(n) {|i| 1}
    @largest_elements = Array.new(n) {|i| i}
  end

  def connected? p, q
    root(p) == root(q)
  end

  def find i
    @largest_elements[root(i)]
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

      # update the largest element
      # comparing in array is slower but the code is easier to read
      # https://stackoverflow.com/questions/2438885/elegant-ruby-syntax-to-return-the-greater-of-two-objects
      @largest_elements[p_root] = [@largest_elements[p_root], @largest_elements[q_root]].max
    else
      @items[p_root] = q_root

      @sizes[q_root] += @sizes[p_root]

      @largest_elements[q_root] = [@largest_elements[p_root], @largest_elements[q_root]].max
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
