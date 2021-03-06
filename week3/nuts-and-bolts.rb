# Refs:
# https://gist.github.com/nmjmdr/c6c3a70d86144802662d#file-nutsandbolts-go-L28
# https://www.geeksforgeeks.org/nuts-bolts-problem-lock-key-problem/
# https://www.youtube.com/watch?v=ZHVk2blR45Q
# https://aaronice.gitbook.io/lintcode/two_pointers/nuts_and_bolts_problem
# https://xinjiema.gitbooks.io/leetcode/content/two-pointer/nuts-and-bolts-problem.html

class NutsAndBolts
  def initialize nuts, bolts
    @nuts = nuts
    @bolts = bolts
  end

  def match lo, hi
    return if lo >= hi

    puts "Partition nuts: #{@nuts}"
    pivot = partition(@nuts, lo, hi, @bolts[lo])

    puts "Partition bolts: #{@bolts}"
    partition(@bolts, lo, hi, @nuts[pivot])

    match(lo, pivot - 1)
    match(pivot + 1, hi)
  end

  def partition array, lo, hi, pivot
    i = lo
    j = hi

    puts "Pivot: #{pivot}"

    while true
      i += 1 while (array[i] < pivot && i < hi)

      j -= 1 while (array[j] > pivot && j > lo)

      break if i >= j

      puts "Swap: #{array[i]}, #{array[j]} = #{array[j]}, #{array[i]}"
      array[i], array[j] = array[j], array[i]
    end

    j
  end

  def result
    puts "Nuts:  #{@nuts}"
    puts "Bolts: #{@bolts}"
  end
end

array = (1..6).to_a
nuts = array.shuffle
bolts = array.shuffle

nab = NutsAndBolts.new(nuts, bolts)
nab.match(0, (nuts.size - 1))
nab.result
