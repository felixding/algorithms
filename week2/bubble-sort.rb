def bubble_sort array
  return array if array.size <= 1

  swap = true

  while swap
    swap = false

    (array.size - 1).times do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        swap = true

        #puts "array: #{array}"
      end
    end
  end

  array
end

#array_to_sort = %w(dd eb ea ae ac ab bd ca).to_a.shuffle
array_to_sort = (0..9).to_a.reverse

puts "Array to sort: #{array_to_sort}"

sorted = bubble_sort array_to_sort

puts "Array sorted: #{sorted}"
