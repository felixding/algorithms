# https://github.com/mberlanda/algorithm-princeton/blob/master/week_3/quicksort/quicksort.rb

class Array
  def quick_sort
    first, *rest = self

    first ? rest.partition {|e| e < first}.inject {|left, right| left.quick_sort + [first] + right.quick_sort} : []
  end
end

array = (1..10).to_a.shuffle
puts array.inspect
puts array.quick_sort.inspect

def quick_sort array
  pivot, *t = array
  pivot ? t.partition {|e| e < pivot}.inject {|l, r| quick_sort(l) + [pivot] + quick_sort(r)} : []
end

array = (1..10).to_a.shuffle
puts array.inspect
puts quick_sort(array).inspect
