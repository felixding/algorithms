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
