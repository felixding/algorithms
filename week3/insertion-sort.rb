def insertion_sort array
  return array if array.size <= 1

  array.size.times do |i|
    while i > 0
      array[i - 1] > array[i] ? (array[i - 1], array[i] = array[i], array[i - 1]) : break

      i -= 1
    end
  end

  array
end

#array_to_sort = %w(dd eb ea ae ac ab bd ca).to_a.shuffle
array_to_sort = (0..9).to_a.shuffle

puts "Array to sort: #{array_to_sort}"

sorted = insertion_sort array_to_sort

puts "Array sorted: #{sorted}"
