def selection_sort array
  return array if (n = array.size - 1) <= 0

  n.times do |i|
    min_index = i

    for j in (i + 1)..n
      min_index = j if array[min_index] > array[j]
    end

    array[i], array[min_index] = array[min_index], array[i] if min_index != i
  end

  array
end

#array_to_sort = %w(dd eb ea ae ac ab bd ca).to_a.shuffle
array_to_sort = (0..9).to_a.shuffle

puts "Array to sort: #{array_to_sort}"

sorted = selection_sort array_to_sort

puts "Array sorted: #{sorted}"
