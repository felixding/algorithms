# https://stackabuse.com/quicksort-in-javascript/

def quick_sort array, first = 0, last = array.size - 1
  return if first >= last

  pivot = partition array, first, last

  quick_sort array, first, pivot - 1
  quick_sort array, pivot + 1, last

  array
end

def partition array, first, last
  # use the last element as the pivot
  pivot = array[last]
  new_pivot = first
  i = first

  # partition
  puts "while i #{i} < last #{last}"
  while i < last

    puts "if array[i] #{array[i]} < pivot #{pivot}"
    if array[i] < pivot
      # swap
      puts "array[i] #{array[i]}, array[new_pivot] #{array[new_pivot]} = array[new_pivot] #{array[new_pivot]}, array[i] #{array[i]}"
      array[i], array[new_pivot] = array[new_pivot], array[i]
      puts array.to_s

      puts "new_pivot #{new_pivot} += 1"
      new_pivot += 1
    end

    puts "i #{i} += 1"
    i += 1
  end

  # swap
  puts "array[new_pivot] #{array[new_pivot]}, array[last] #{array[last]} = array[last] #{array[last]}, array[new_pivot] #{array[new_pivot]}"
  array[new_pivot], array[last] = array[last], array[new_pivot]
  puts array.to_s

  new_pivot
end

array_to_sort = (0..9).to_a.shuffle
puts "Array to sort: #{array_to_sort}"
sorted = quick_sort array_to_sort
puts "Array sorted: #{sorted}"
