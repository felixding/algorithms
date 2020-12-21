class IllegalArgumentException < StandardError
end

class Percolation
  def initialize n
    @n = n
    @items = Array.new(@n * @n + 2) {|i| i}
    @sizes = Array.new(@n * @n + 2) {|i| 1}
    @largest_elements = Array.new(@n * @n + 2) {|i| i}
    @is_open = Array.new(@n * @n) {|i| false}
    @source_site = 0
    @sink_site = (@n * @n + 1)

    # connect to source (top virtual site) and sink (bottom virtual site)
    @n.times.each do |i|
      site = get_site(1, i)
      union(@source_site, site)

      site = get_site(@n, i)
      union(@sink_site, site)
    end
  end

  def open row, col
    return if is_open?(row, col)

    site = get_site(row, col)

    @is_open[site] = true

    # connect neighbours
    neighbouring_sites = get_neighbouring_sites(row, col)

    neighbouring_sites.each do |neighbouring_site|
      union(site, neighbouring_site)
    end
  end

  def is_open? row, col
    site = get_site(row, col)

    @is_open[site]
  end

  def is_full? row, col
    # a full site must be an open site
    return false unless is_open?(row, col)

    # and is connected to the source
    site = get_site(row, col)
    connected?(site, @source_site)
  end

  def number_of_open_sites
    @is_open.select{|e| e == true}.size
  end

  def percolates?
    connected? @source_site, @sink_site
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

  def get_site row, col
    @n * (row - 1)  + col
  end

  def get_neighbouring_sites row, col
    neighbouring_sites = []

    # up
    if row > 1
      site = get_site(row - 1, col)

      neighbouring_sites << site if @is_open[site]
    end

    # down
    if row < @n
      site = get_site(row + 1, col)

      neighbouring_sites << site if @is_open[site]
    end

    # left
    if col > 1
      site = get_site(row, col - 1)

      neighbouring_sites << site if @is_open[site]
    end

    # right
    if col < @n
      site = get_site(row, col + 1)

      neighbouring_sites << site if @is_open[site]
    end

    neighbouring_sites
  end
end

class PercolationStats
  def initialize n, trials
    @trials = trials
    @ps = []

    @trials.times do |i|
      uf = Percolation.new n

      while !uf.percolates? do
        row = (1..n).to_a.sample
        col = (1..n).to_a.sample

        puts "open #{row} #{col}"

        uf.open(row, col)
      end

      p = uf.number_of_open_sites / (n * n).to_f

      @ps << p
    end

    puts "mean\t\t\t\t= #{mean}"
    puts "stddev\t\t\t\t= #{stddev}"
    print "95% confidence interval\t\t= #{[confidence_lo, confidence_hi]}\n"
  end

  def mean
    return @mean if @mean

    @mean = 0

    @ps.each {|e| @mean += e}

    @mean /= @trials
  end

  def stddev
    return @stddev if @stddev

    @stddev = 0

    return if @trials == 1

    @ps.each {|e| @stddev += (e - @mean) * (e - @mean)}

    @stddev /= @trials - 1
  end

  def confidence_lo
    return @confidence_lo if @confidence_lo

    @mean - (1.96 * Math.sqrt(@stddev) / Math.sqrt(@trials))
  end

  def confidence_hi
    return @confidence_lo if @confidence_lo

    @mean + (1.96 * Math.sqrt(@stddev) / Math.sqrt(@trials))
  end
end

PercolationStats.new 200, 100
