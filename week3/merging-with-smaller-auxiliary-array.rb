n = 10

array = [(0..(n - 1)).to_a, (n..(2 * n - 1)).to_a]
auxiliary_array = Array.new n

n = 3
array = [10, 32, 55, 9, 17, 28]
puts "array: #{array}"

auxiliary_array = array[0, n]
puts "auxiliary_array: #{auxiliary_array}"

i = 0
j = n
k = 0

while k < array.size
  #puts "auxiliary_array[i]: #{auxiliary_array[i]}, array[j]: #{array[j]}"

  if i >= n
    array[k] = array[j]
    j += 1

  elsif j >= array.size
    array[k] = auxiliary_array[i]
    i += 1

  elsif auxiliary_array[i] > array[j]
    array[k] = array[j]
    j += 1

  else
    array[k] = auxiliary_array[i]
    i += 1
  end

  k += 1
end

puts "array: #{array}"
