# https://www.youtube.com/watch?v=owZhw-A0yWE
@inversion = 0

def merge_sort array_to_sort
  return array_to_sort unless array_to_sort.size > 1

  mid = array_to_sort.size / 2
  a, b, array_sorted = merge_sort(array_to_sort[0...mid]), merge_sort(array_to_sort[mid..-1]), []


  while [a, b].none?(&:empty?)
    if a[0] > b[0]
      @inversion += a.size
      array_sorted << b.shift
    else
      array_sorted << a.shift
    end
  end

  array_sorted + a + b
end

array = [9, 6, 8, 4] # 5 inversions
#array = [1, 20, 6, 7, 5, 8, 11, 3] # 13 inversions

puts "array: #{array}"
puts "sorted: #{merge_sort array}"
puts "inversion: #{@inversion}"
