# https://stackoverflow.com/questions/25799520/union-find-expressed-as-a-social-network
# https://shadowoom.github.io/algorithm/coursera/2018/04/11/social-network-connectivity/
class SocialNetworkConnectivity
  attr :items

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

  def root i
    @items[i] == i ? i : root(@items[i])
  end
end

logs = %q{
0 1 2015-08-14 18:00:00
1 9 2015-08-14 18:01:00
0 2 2015-08-14 18:02:00
0 3 2015-08-14 18:04:00
0 4 2015-08-14 18:06:00
0 5 2015-08-14 18:08:00
0 6 2015-08-14 18:10:00
0 7 2015-08-14 18:12:00
0 8 2015-08-14 18:14:00
1 2 2015-08-14 18:16:00
1 3 2015-08-14 18:18:00
1 4 2015-08-14 18:20:00
1 5 2015-08-14 18:22:00
2 1 2015-08-14 18:24:00
2 3 2015-08-14 18:26:00
2 4 2015-08-14 18:28:00
5 5 2015-08-14 18:30:00
}

uf = SocialNetworkConnectivity.new 10
count = uf.items.size

logs.lines.each do |log|
  log.strip!

  next if log == ''

  matched, p, q, timestamp = log.match(/(\d) (\d) (.+)/).to_a

  p = p.to_i
  q = q.to_i

  if uf.root(p) != uf.root(q)
    uf.union p, q

    count -= 1

    if count == 1
      puts
      puts timestamp
      exit 0
    end
  end
end
