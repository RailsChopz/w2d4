# Phase One - n^2

def my_min(list)
  i = 0
  while i < list.length
    return list[i] if list.all? { |j| list[i] <= j }
    i += 1
  end
end  


# Phase Two - n
def my_good_min(list)
  smallest = list.first
  
  list.each do |num|
    if num < smallest
      smallest = num
    end
  end
  
  smallest
end

# Phase One - n^3
def slow_subsum(list)
  sublists = []
  list.each_index do |i|
    list.each_index do |j|
      sublists << list[i..j] if j >= i
    end
  end
  sublists.map {|sl| sl.reduce(&:+)}.max
end

# Phase 2 - n
def fast_sub_sum(list)
  frame = 0
  best = list.first
  
  list.each do |el|
    frame += el
    best = frame if frame > best  
    frame = 0 if frame < 0
    best = el if el > best
  end
  best
end





p my_min([ 0, 3, 5, 4, -5, 10, 1, 90 ])
p my_good_min([ 0, 3, 5, 4, -5, 10, 1, 90 ])
p slow_subsum([2,3,-6,7,-6,7])
p fast_sub_sum([2,3,-6,7,-6,7])
p fast_sub_sum([-5, -1, -3])