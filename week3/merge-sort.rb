# https://gist.github.com/bih/9726300
def merge_sort array_to_sort
  return array_to_sort unless array_to_sort.size > 1

  mid = array_to_sort.size / 2
  a, b, array_sorted = merge_sort(array_to_sort[0...mid]), merge_sort(array_to_sort[mid..-1]), []
  array_sorted << (a[0] > b[0] ? b.shift : a.shift) while [a, b].none?(&:empty?)

  array_sorted + a + b
end

#array_to_sort = (1..10).to_a.shuffle
array_to_sort = %w(dd eb ea ae ac ab bd ca).to_a.shuffle

puts "Array to sort: #{array_to_sort}"

m = merge_sort array_to_sort

puts "Array sorted: #{m}"

# summary of sorting algorithms and Ruby implementations
# https://medium.com/@limichelle21/read-it-learn-it-build-it-sorting-algorithms-in-ruby-ead04b04baa6
