# found another implementation:
# https://github.com/mberlanda/algorithm-princeton/blob/master/week_3/quicksort/quicksort.rb

def quick_sort array
  return array if (n = array.size) <= 1

  # pick a random pivot
  pivot = array.delete_at(rand(n))

  # put smaller elements to the left and vice versa
  left = []
  right = []

  array.each {|i| i > pivot ? (right << i) : (left << i)}

  # recursion
  return *quick_sort(left), pivot, *quick_sort(right)
end

array_to_sort = %w(dd eb ea ae ac ab bd ca).to_a.shuffle
#array_to_sort = (0..9).to_a.shuffle

puts "Array to sort: #{array_to_sort}"

sorted = quick_sort array_to_sort

puts "Array sorted: #{sorted}"

#
# benchmark
#
# require 'benchmark'
#
# array = (1..10000000).to_a
# #array = array.shuffle
#
# time = Benchmark.measure do
#   quick_sort array
# end
#
# puts time.real

# 1 million
# With shuffle
# Time: (3.23426999989897 + 3.4910959999542683 + 3.9921659999527037) / 3 = 3.5725106666

# Without shuffle
# Time: (3.3456660001538694 + 3.7669450000394136 + 3.726056999992579) / 3 = 3.6128893334

# 10 million
# With shuffle
# Time: (46.155843999935314 + 48.77463400014676 + 47.68713299999945) / 3 = 47.5392036667

# Without shuffle
# Time: (46.379102000035346 + 44.44086100021377 + 44.751007999992) / 3 = 45.1903236667

# Conclusion: NO DIFFERENCE
