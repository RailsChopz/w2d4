# Phase 1: O(n!) or O(n*n!) depending on array comparison algo
def first_anagram?(str, test_str)
  str.chars.permutation.to_a.include? test_str.chars
end 

# Phase 2: - O(n)
def second_anagram?(str, test_str)
  str.dup.chars.each do |ch|
    if test_str.include? ch
      str.delete!(ch)
      test_str.delete!(ch)
    end
  end
  p [str, test_str]
  str.empty? && test_str.empty?
end

# Phase 3: O(n log n) or O(n^2) depeending on sort algorithm
def third_anagram?(str, test_str)
  str.chars.sort.join == test_str.chars.sort.join
end

#Phase 4: O(n)
def fourth_anagram?(str, test_str)
  return false if str.length != test_str.length
  diff_hash = Hash.new(0)
  str.length.times do |idx|
    diff_hash[str[idx]] += 1
    diff_hash[test_str[idx]] -= 1
  end
  diff_hash.values.all? { |count| count == 0 }
end


p fourth_anagram?("tar", "rat")
p fourth_anagram?("elvis", "lives")
p fourth_anagram?("dja", "djb")