class Client
  def initialize k
    @deque = []

    # read from STDIN
    File.read(ARGV.last).split(' ').each {|e| enqueue(e.strip)}

    iterator.shuffle[0, k].each {|e| puts e}
  end

  def enqueue item
    @deque.push item
  end

  def iterator
    @deque
  end
end

rq = Client.new ARGV.first.to_i
