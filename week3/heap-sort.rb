def heap_sort array
  return array if (n = array.size) <= 1
end

array_to_sort = %w(dd eb ea ae ac ab bd ca).to_a.shuffle
#array_to_sort = (0..9).to_a.shuffle

puts "Array to sort: #{array_to_sort}"

sorted = heap_sort array_to_sort

puts "Array sorted: #{sorted}"
