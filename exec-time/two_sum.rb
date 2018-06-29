# Brute force O(n^2)
def bad_two_sum(array, target)
  i = 0
  
  while i < array.length - 1
    j = i + 1
    while j < array.length
      return true if array[i] + array[j] == target
      j += 1
    end
    i += 1
  end
  
  false
end


#iterator version
def merge_sort(arr)
  arr = arr.map { |el| [el]}
  arr << merge(arr.shift, arr.shift) until arr.one?
  arr.pop
end


def merge(left, right)
  merged = []
  until left.empty? || right.empty?
    if left.first > right.first
      merged << right.shift
    else
      merged << left.shift
    end
  end
  merged.concat(left, right)
end

p merge_sort((1..22).to_a.shuffle)


def binary_search(array, target)
  mid = array.length / 2
  return mid if array[mid] == target
  
  if array[mid] > target
    left = array.take(mid)
    binary_search(left, target)
  else
    right = array.drop(mid)
    mid + 1 + binary_search(right, target)
  end
    
end