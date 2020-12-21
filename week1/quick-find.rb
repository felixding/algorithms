class QuickFind
  def initialize n
    @items = Array.new(n) {|i| i}
  end

  def connected? p, q
    @items[p] == @items[q]
  end

  def union p, q
    pid = @items[p]
    puts

    @items.each_index do |i|
      #puts "i: #{i}, @items[i]: #{@items[i]}, @items[p]: #{@items[p]}, (@items[i] == @items[p]): #{(@items[i] == @items[p])}"

      if @items[i] == pid
        @items[i] = @items[q]

        puts "Connected #{p} with #{q}"
      end
    end

    puts "@items: #{@items}"
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

uf = QuickFind.new 10

operations.each do |operation|
  p, q = operation

  uf.union p, q
end
