# https://stackoverflow.com/questions/12167630/algorithm-for-shuffling-a-linked-list-in-n-log-n-time
# https://stackoverflow.com/a/16851014

# Too lazy to define a linked list in Ruby
def shuffle array
  (array.size - 1).downto(1) do |i|
    j = rand(i + 1)

    array[i], array[j] = array[j], array[i]
  end

  array
end

array = (1..5).to_a

puts "array: #{array}"
puts "array: #{shuffle array}"
